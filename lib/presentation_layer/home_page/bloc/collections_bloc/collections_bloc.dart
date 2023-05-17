import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

import 'package:sample_app/domain_layer/model/display/collection/collection.model.dart';
import 'package:sample_app/domain_layer/usecase/display/get_collections_by_store_type.usecase.dart';

part 'collections_event.dart';

part 'collections_state.dart';

part 'collections_bloc.freezed.dart';

enum StoreType { market, beauty }

enum CollectionsStatus { initial, loading, success, failure }

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final DisplayUsecase _displayUsecase;

  CollectionsBloc(this._displayUsecase) : super(CollectionsState()) {
    on<CollectionsInitialized>(_onCollectionsInitialized);
    on<ToggledStoreTypes>(_onToggledStoreTypes);
  }

  Future<void> _onCollectionsInitialized(
    CollectionsInitialized event,
    Emitter<CollectionsState> emit,
  ) async {
    final initializedStoreType = event.storeType ?? StoreType.market;

    emit(state.copyWith(
        status: CollectionsStatus.loading, storeType: initializedStoreType));

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
          collections: collections,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: CollectionsStatus.failure));
      log('[error] $error');
    }
  }

  Future<void> _onToggledStoreTypes(
      ToggledStoreTypes event, Emitter<CollectionsState> emit) async {
    final currentStoreType = StoreType.values[event.tabIndex];

    if (!state.status.isSuccess) return;
    // if (state.collections.isEmpty) {
      emit(state.copyWith(status: CollectionsStatus.loading));
    // }
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
    final response = await _displayUsecase
        .fetch(GetCollectionsByStoreType(storeType: storeType));

    return response;
  }
}

extension CollectionsStatusEx on CollectionsStatus {
  bool get isInitial => this == CollectionsStatus.initial;

  bool get isLoading => this == CollectionsStatus.loading;

  bool get isSuccess => this == CollectionsStatus.success;

  bool get isFailure => this == CollectionsStatus.failure;
}
