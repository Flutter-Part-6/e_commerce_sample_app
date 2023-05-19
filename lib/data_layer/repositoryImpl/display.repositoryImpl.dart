/// data_source
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';

/// Model & Mapper
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';

import '../data_source/local_storage/display_dao.dart';
import '../entity/display/view_module/view_module.entity.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  DisplayRepositoryImpl(this._displayApi);

  final DisplayApi _displayApi;

  @override
  Future<List<Collection>> getCollectionsByStoreType({
    required String storeType,
    Map<String, String>? queries,
  }) async {
    final response =
        await _displayApi.getCollectionsByStoreType(storeType: storeType);

    final List<Collection> collections =
        response.map((collectionDto) => collectionDto.toModel()).toList();

    return collections;
  }

  @override
  Future<List<ViewModule>> getViewModulesByStoreTypeAndTabId({
    required bool isRefresh,
    required String storeType,
    required int tabId,
    Map<String, String>? queries,
  }) async {
    final displayDao = DisplayDao();

    // final cacheKey = '${storeType}_$tabId';
    // final List<ViewModuleEntity> cachedViewModules =
    //     await displayDao.getViewModules(cacheKey);
    //
    // //TODO refresh인 경우 개발해야 됌
    // if (cachedViewModules.isNotEmpty) {
    //   final viewModules = cachedViewModules
    //       .map((viewModuleEntity) => viewModuleEntity.toModel())
    //       .toList();
    //   return viewModules;
    // }

    final response = await _displayApi.getViewModulesByStoreTypeAndTabId(
      storeType: storeType,
      tabId: tabId,
    );

    final List<ViewModule> viewModules =
        response.map((viewModuleDto) => viewModuleDto.toModel()).toList();

    // // delete cache
    // await displayDao.clearViewModules(cacheKey);
    //
    // // insert local_storage
    // await displayDao.insertViewModules(
    //     cacheKey, viewModules.map((e) => e.toEntity()).toList());

    return viewModules;
  }
}
