/// data_source
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';

/// Model & Mapper
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';

import '../data_source/local_storage/display_dao.dart';

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
    required int page,
  }) async {
    // final displayDao = DisplayDao();

    // final cacheKey = '${storeType}_${tabId}_$page';
    // final List<ViewModuleEntity> cachedViewModules =
    //     await displayDao.getViewModules(cacheKey);

    //TODO refresh인 경우 개발해야 됌
    // if (cachedViewModules.isNotEmpty) {
    //   final viewModules = cachedViewModules
    //       .map((viewModuleEntity) => viewModuleEntity.toModel())
    //       .toList();
    //   print('[test] test cache');
    //   return viewModules;
    // }

    final response = await _displayApi.getViewModulesByStoreTypeAndTabId(
      storeType: storeType,
      tabId: tabId,
      page: page,
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

  @override
  Future<void> addCart({required Cart cart}) async {
    final displayDao = DisplayDao();

    await displayDao.insertCarts(cart.toEntity());
  }

  @override
  Future<List<Cart>> getCartList() async {
    final displayDao = DisplayDao();

    final response = await displayDao.getCartList();

    List<Cart> cartList = response.map((e) => e.toModel()).toList();

    return cartList;
  }
}
