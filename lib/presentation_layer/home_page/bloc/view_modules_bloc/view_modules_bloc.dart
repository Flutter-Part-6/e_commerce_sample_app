import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/common/utils/exceptions/network_exception.dart';
import 'package:sample_app/common/utils/exceptions/service_exception.dart';
import 'package:sample_app/common/utils/logger.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../../component/view_modules/core/view_module_factory.dart';
import '../collections_bloc/collections_bloc.dart';

part 'view_modules_event.dart';

part 'view_modules_state.dart';

part 'view_modules_bloc.freezed.dart';

const String _currentPage = 'currentpage';

const _throttleDuration = Duration(milliseconds: 300);

enum ViewModulesStatus { initial, loading, success, failure }

EventTransformer<E> _throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class ViewModulesBloc extends Bloc<ViewModulesEvent, ViewModulesState> {
  final DisplayUsecase _displayUsecase;

  ViewModulesBloc(this._displayUsecase) : super(ViewModulesState()) {
    on<ViewModulesInitialized>(_onViewModulesInitialized);
    on<ViewModulesFetched>(
      _onViewModulesFetched,
      transformer: _throttleDroppable(_throttleDuration),
    );
  }

  Future<void> _onViewModulesInitialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    try {
      final storeType = event.storeType;
      final tabId = event.tabId;
      final isRefresh = event.isRefresh;

      if (isRefresh) {
        emit(state.copyWith(
          status: ViewModulesStatus.initial,
          currentPage: 1,
          endOfPage: false,
          viewModules: [],
        ));
      }

      emit(state.copyWith(status: ViewModulesStatus.loading));

      final List<ViewModule> response =
          await _fetch(storeType, tabId, isRefresh: isRefresh);

      ViewModuleFactory viewModuleFactory = ViewModuleFactory();
      final List<Widget> viewModules =
          response.map((e) => viewModuleFactory.textToWidget(e)).toList();

      //TODO 디바이더 삭제해야됌 테스트용
      viewModules.add(Divider(thickness: 10));

      emit(state.copyWith(
        status: ViewModulesStatus.success,
        storeType: storeType,
        tabId: tabId,
        viewModules: viewModules,
      ));
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: ViewModulesStatus.failure));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: ViewModulesStatus.failure));
    } catch (error) {
      CustomLogger.logger.e(error.toString());
    }
  }

  Future<void> _onViewModulesFetched(
    ViewModulesFetched event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = state.storeType;
    final tabId = state.tabId;
    final currentPage = state.currentPage;
    final endOfPage = state.endOfPage;

    // 끝 page 에 도달한 경우 return
    if (endOfPage) return;

    final nextPage = currentPage + 1;
    final Map<String, String> queryParams = {_currentPage: '$nextPage'};
    emit(state.copyWith(status: ViewModulesStatus.loading));

    try {
      ViewModuleFactory viewModuleFactory = ViewModuleFactory();

      final List<ViewModule> response =
          await _fetch(storeType, tabId, queryParams: queryParams);

      // 다음 페이지를 호출했을 때 empty라면 endOfPage -> true
      final List<Widget> viewModules = [...state.viewModules];
      viewModules.addAll(
        response.map((e) => viewModuleFactory.textToWidget(e)).toList(),
      );

      //TODO 디바이더 삭제해야됌 테스트용
      viewModules.add(Divider(thickness: 10));

      if (response.isEmpty) {
        emit(state.copyWith(
          status: ViewModulesStatus.success,
          viewModules: viewModules,
          currentPage: nextPage,
          endOfPage: true,
        ));

        return;
      }

      emit(state.copyWith(
        status: ViewModulesStatus.success,
        viewModules: viewModules,
        currentPage: nextPage,
      ));
    } catch (error) {
      emit(state.copyWith(status: ViewModulesStatus.failure));
      log('[error] $error');
    }
  }

  Future<List<ViewModule>> _fetch(
    StoreType storeType,
    int tabId, {
    bool isRefresh = false,
    Map<String, String>? queryParams,
  }) async {
    final response = _displayUsecase.fetch(
      GetViewModulesByStoreTypeAndTabId(
        storeType: storeType,
        tabId: tabId,
        isRefresh: isRefresh,
        params: queryParams,
      ),
    );

    return await response;
  }
}

extension ViewModulesStatusEx on ViewModulesStatus {
  bool get isInitial => this == ViewModulesStatus.initial;

  bool get isLoading => this == ViewModulesStatus.loading;

  bool get isSuccess => this == ViewModulesStatus.success;

  bool get isFailure => this == ViewModulesStatus.failure;
}
