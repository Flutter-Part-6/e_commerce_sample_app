import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';

import '../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../collections_bloc/collections_bloc.dart';

part 'view_modules_event.dart';

part 'view_modules_state.dart';

part 'view_modules_bloc.freezed.dart';

enum ViewModulesStatus { initial, loading, success, failure }

class ViewModulesBloc extends Bloc<ViewModulesEvent, ViewModulesState> {
  final DisplayUsecase _displayUsecase;

  ViewModulesBloc(this._displayUsecase) : super(ViewModulesState()) {
    on<ViewModulesInitialized>(_onViewModulesInitialized);
    on<ViewModulesFetched>(_onViewModulesFetched);
  }

  Future<void> _onViewModulesInitialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = event.storeType ?? StoreType.market;
    final List<Collection> collections = event.collections ?? [];

    // 사실 절대 empty 일 경우는 없다.
    if (collections.isEmpty) {
      emit(state.copyWith(status: [ViewModulesStatus.failure]));
      return;
    }

    // 첫번째(홈) 인 경우는 loading 초기화
    final List<ViewModulesStatus> initializedStatus = [
      ViewModulesStatus.loading,
      ...collections.skip(1).map((e) => ViewModulesStatus.initial)
    ];
    // viewModules 초기화
    final Map<int, List<ViewModule>> initializedViewModules = {
      for (final collection in collections) collection.tabId: []
    };

    emit(
      state.copyWith(
        status: initializedStatus,
        viewModules: initializedViewModules,
      ),
    );

    try {
      final tabId = collections.first.tabId;

      final List<ViewModule> response = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );

      final List<ViewModulesStatus> status = [...state.status];
      status[0] = ViewModulesStatus.success;

      final Map<int, List<ViewModule>> viewModules = {...state.viewModules};
      viewModules[tabId] = response;

      emit(state.copyWith(
        storeType: storeType,
        collections: collections,
        status: status,
        viewModules: viewModules,
      ));
    } catch (error) {
      emit(state.copyWith(status: [ViewModulesStatus.failure]));
      log('[error] $error');
    }
  }

  Future<void> _onViewModulesFetched(
    ViewModulesFetched event,
    Emitter<ViewModulesState> emit,
  ) async {
    final collections = state.collections;

    final tabIndex = event.tabIndex;
    final tabId = collections[tabIndex].tabId;

    if (tabIndex >= collections.length) return;

    Map<int, List<ViewModule>> viewModules = {...state.viewModules};
    if (viewModules[tabId]?.isNotEmpty ?? false) return;

    List<ViewModulesStatus> statusLoading = [...state.status]..[tabIndex] =
        ViewModulesStatus.loading;

    emit(state.copyWith(status: statusLoading));

    try {
      final storeType = state.storeType;

      final List<ViewModule> response = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );

      List<ViewModulesStatus> statusSuccess = [...state.status]..[tabIndex] =
          ViewModulesStatus.success;

      viewModules[tabId] = response;

      emit(state.copyWith(status: statusSuccess, viewModules: viewModules));
    } catch (error) {
      emit(state.copyWith(status: [ViewModulesStatus.failure]));
      log('[error] $error');
    }
  }
}

extension ViewModulesStatusEx on ViewModulesStatus {
  bool get isInitial => this == ViewModulesStatus.initial;

  bool get isLoading => this == ViewModulesStatus.loading;

  bool get isSuccess => this == ViewModulesStatus.success;

  bool get isFailure => this == ViewModulesStatus.failure;
}
