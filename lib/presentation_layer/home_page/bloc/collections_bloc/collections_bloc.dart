import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

import 'package:sample_app/domain_layer/model/display/collection/collection.model.dart';
import 'package:sample_app/domain_layer/usecase/display/get_collections_by_store_type.usecase.dart';

part 'collections_event.dart';

part 'collections_state.dart';

part 'collections_bloc.freezed.dart';

enum StoreType { market, beauty }

extension StoreTypeEx on StoreType {
  String get toName {
    switch (this) {
      case StoreType.market:
        return '마켓컬리';
      case StoreType.beauty:
        return '뷰티컬리';
    }
  }

  get isMarket => this == StoreType.market;

  get isBeauty => this == StoreType.beauty;
}

enum CollectionsStatus { initial, loading, success, failure }

@injectable
class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final DisplayUsecase _displayUsecase;

  CollectionsBloc(this._displayUsecase) : super(CollectionsState()) {
    on<CollectionsInitialized>(_onCollectionsInitialized);
    on<ToggledStoreTypes>(_onToggledStoreTypes);
    on<ChangedTab>(_onChangedTab);
  }

  Future<void> _onCollectionsInitialized(
    CollectionsInitialized event,
    Emitter<CollectionsState> emit,
  ) async {
    final initializedStoreType = event.storeType ?? StoreType.market;

    emit(state.copyWith(
      status: CollectionsStatus.loading,
      storeType: initializedStoreType,
    ));

    try {
      final List<Collection> collections =
          await _fetchCollections(initializedStoreType);

      if (collections.isEmpty) {
        emit(state.copyWith(status: CollectionsStatus.failure));

        return;
      }

      emit(
        state.copyWith(
          status: CollectionsStatus.success,
          currentTabId: collections.first.tabId,
          collections: collections,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: CollectionsStatus.failure));
      log('[error] $error');
    }
  }

  void _onChangedTab(ChangedTab event, Emitter<CollectionsState> emit) {
    if (!state.status.isSuccess) return;
    final currentTabId = state.currentTabId;
    final nextTabId = event.tabId;
    if (nextTabId == currentTabId) return;
    emit(state.copyWith(currentTabId: nextTabId));
  }

  Future<void> _onToggledStoreTypes(
    ToggledStoreTypes event,
    Emitter<CollectionsState> emit,
  ) async {
    final currentStoreType = StoreType.values[event.tabIndex];

    if (!state.status.isSuccess) return;
    emit(state.copyWith(status: CollectionsStatus.loading));
    // await Future.delayed(Duration(seconds: 3));
    try {
      final List<Collection> collections =
          await _fetchCollections(currentStoreType);

      if (collections.isEmpty) {
        emit(state.copyWith(status: CollectionsStatus.failure));

        return;
      }

      emit(
        state.copyWith(
          status: CollectionsStatus.success,
          storeType: currentStoreType,
          collections: collections,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: CollectionsStatus.failure));
      log('[error] $error');
    }
  }

  Future<List<Collection>> _fetchCollections(StoreType storeType) async {
    return await _displayUsecase
        .fetch(GetCollectionsByStoreType(storeType: storeType));
  }
}

extension CollectionsStatusEx on CollectionsStatus {
  bool get isInitial => this == CollectionsStatus.initial;

  bool get isLoading => this == CollectionsStatus.loading;

  bool get isSuccess => this == CollectionsStatus.success;

  bool get isFailure => this == CollectionsStatus.failure;
}
