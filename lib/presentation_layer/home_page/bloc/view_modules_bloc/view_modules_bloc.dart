import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';

import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../collections_bloc/collections_bloc.dart';

part 'view_modules_event.dart';

part 'view_modules_state.dart';

part 'view_modules_bloc.freezed.dart';

enum ViewModulesStatus { initial, loading, success, failure }

@injectable
class ViewModulesBloc extends Bloc<ViewModulesEvent, ViewModulesState> {
  final DisplayUsecase _displayUsecase;

  ViewModulesBloc(this._displayUsecase) : super(ViewModulesState()) {
    on<ViewModulesInitialized>(_onViewModulesInitialized);
  }

  Future<void> _onViewModulesInitialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = event.storeType;
    final tabId = event.tabId;

    emit(state.copyWith(status: ViewModulesStatus.loading));

    try {
      final List<ViewModule> viewModules =
          await _fetchViewModules(storeType, tabId);

      emit(state.copyWith(
        status: ViewModulesStatus.success,
        storeType: storeType,
        viewModules: viewModules,
      ));
    } catch (error) {
      emit(state.copyWith(status: ViewModulesStatus.failure));
      log('[error] $error');
    }
  }

  Future<List<ViewModule>> _fetchViewModules(
    StoreType storeType,
    int tabId,
  ) async {
    final response = _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId));

    return await response;
  }
}

extension ViewModulesStatusEx on ViewModulesStatus {
  bool get isInitial => this == ViewModulesStatus.initial;

  bool get isLoading => this == ViewModulesStatus.loading;

  bool get isSuccess => this == ViewModulesStatus.success;

  bool get isFailure => this == ViewModulesStatus.failure;
}
