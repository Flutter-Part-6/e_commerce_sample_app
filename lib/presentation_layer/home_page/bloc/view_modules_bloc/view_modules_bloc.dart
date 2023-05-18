import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';

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
    // on<ViewModulesFetched>(_onViewModulesFetched);
  }

  Future<void> _onViewModulesInitialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = event.storeType ?? StoreType.market;
    final tabId = event.tabId;

    emit(state.copyWith(status: ViewModulesStatus.loading));

    try {
      final List<ViewModule> viewModules = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );

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

//   Future<void> _onViewModulesFetched(
//     ViewModulesFetched event,
//     Emitter<ViewModulesState> emit,
//   ) async {
//     final tabId = event.tabId;
//     final viewModules = state.viewModules;
//
//     emit(state.copyWith(status: ViewModulesStatus.loading));
//     await Future.delayed(Duration(seconds: 3));
//
//     try {
//       final storeType = state.storeType;
//
//       final List<ViewModule> response = await _displayUsecase.fetch(
//         GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
//       );
//
//       // List<ViewModulesStatus> statusSuccess = [...state.status]..[tabIndex] =
//       //     ViewModulesStatus.success;
//       //
//       // viewModules[tabId] = response;
//
//       emit(state.copyWith(
//           status: ViewModulesStatus.success, viewModules: response));
//     } catch (error) {
//       emit(state.copyWith(status: ViewModulesStatus.failure));
//       log('[error] $error');
//     }
//   }
}

extension ViewModulesStatusEx on ViewModulesStatus {
  bool get isInitial => this == ViewModulesStatus.initial;

  bool get isLoading => this == ViewModulesStatus.loading;

  bool get isSuccess => this == ViewModulesStatus.success;

  bool get isFailure => this == ViewModulesStatus.failure;
}
