import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/exceptions/network_exception.dart';
import '../../../../common/utils/exceptions/service_exception.dart';
import '../../../../common/utils/logger.dart';
import '../../../../domain_layer/usecase/display.usecase.dart';
import '../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../../domain_layer/usecase/display/collections/get_collections_by_store_type.usecase.dart';
import '../../../../common/constants.dart';

part 'collections_event.dart';

part 'collections_state.dart';

part 'collections_bloc.freezed.dart';

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
      status: Status.loading,
      storeType: storeType,
    ));

    try {
      final List<Collection> collections = await _fetch(storeType: storeType);
      final int currentTabId = collections.first.tabId;

      _validateCollections(collections);

      emit(
        state.copyWith(
          status: Status.success,
          currentTabId: currentTabId,
          collections: collections,
        ),
      );
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
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

    if (state.storeType.index == event.tabIndex) return;

    emit(state.copyWith(status: Status.loading));

    //입력 받은 storeType
    final storeType = StoreType.values[event.tabIndex];

    try {
      final List<Collection> collections = await _fetch(storeType: storeType);

      _validateCollections(collections);

      emit(
        state.copyWith(
          status: Status.success,
          storeType: storeType,
          collections: collections,
        ),
      );
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<List<Collection>> _fetch({required StoreType storeType}) async {
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
