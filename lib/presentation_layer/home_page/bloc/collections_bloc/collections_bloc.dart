import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/common/utils/exceptions/network_exception.dart';
import 'package:sample_app/common/utils/exceptions/service_exception.dart';
import 'package:sample_app/common/utils/logger.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

import 'package:sample_app/domain_layer/model/display/collection/collection.model.dart';
import 'package:sample_app/domain_layer/usecase/display/get_collections_by_store_type.usecase.dart';

part 'collections_event.dart';

part 'collections_state.dart';

part 'collections_bloc.freezed.dart';

enum StoreType { market, beauty }

enum CollectionsStatus { initial, loading, success, failure }

@injectable
class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final DisplayUsecase _displayUsecase;

  CollectionsBloc(this._displayUsecase) : super(CollectionsState()) {
    on<CollectionsInitialized>(_onCollectionsInitialized);
    on<ToggledStoreTypes>(_onToggledStoreTypes);
  }

  /// GNB bar(collections bar) 초기화
  Future<void> _onCollectionsInitialized(
    CollectionsInitialized event,
    Emitter<CollectionsState> emit,
  ) async {
    final storeType = event.storeType ?? StoreType.market;

    emit(state.copyWith(
      status: CollectionsStatus.loading,
      storeType: storeType,
    ));

    try {
      final List<Collection> collections = await _fetchCollections(storeType);
      final int currentTabId = collections.first.tabId;

      _validateCollections(collections);

      emit(
        state.copyWith(
          status: CollectionsStatus.success,
          currentTabId: currentTabId,
          collections: collections,
        ),
      );
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: CollectionsStatus.failure));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: CollectionsStatus.failure,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onToggledStoreTypes(
    ToggledStoreTypes event,
    Emitter<CollectionsState> emit,
  ) async {
    if (!state.status.isSuccess) return;

    emit(state.copyWith(status: CollectionsStatus.loading));

    //입력 받은 storeType
    final storeType = StoreType.values[event.tabIndex];

    try {
      final List<Collection> collections = await _fetchCollections(storeType);

      _validateCollections(collections);

      emit(
        state.copyWith(
          status: CollectionsStatus.success,
          storeType: storeType,
          collections: collections,
        ),
      );
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: CollectionsStatus.failure));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: CollectionsStatus.failure,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<List<Collection>> _fetchCollections(StoreType storeType) async {
    return await _displayUsecase
        .fetch(GetCollectionsByStoreType(storeType: storeType));
  }
}

void _validateCollections(List<Collection> collections) {
  // collections bar의 데이터가 없는 경우
  if (collections.isEmpty) {
    final code = 'GNB-0000';
    final status = 'collection data is empty';
    final message = '서비스에 일시적인 오류가 발생했습니다. 잠시 후에 다시 시도해주세요';

    throw ServiceException(code: code, status: status, message: message);
  }
}

extension StoreTypeEx on StoreType {
  String get toName {
    switch (this) {
      case StoreType.market:
        return '마켓다트';
      case StoreType.beauty:
        return '뷰티다트';
    }
  }

  get isMarket => this == StoreType.market;

  get isBeauty => this == StoreType.beauty;
}

extension CollectionsStatusEx on CollectionsStatus {
  bool get isInitial => this == CollectionsStatus.initial;

  bool get isLoading => this == CollectionsStatus.loading;

  bool get isSuccess => this == CollectionsStatus.success;

  bool get isFailure => this == CollectionsStatus.failure;
}
