/// data_source
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';

/// Model & Mapper
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';

import '../data_source/local_storage/display_dao.dart';
import '../data_source/mock/moc_api.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _remoteApi;
  final MockApi _mockApi;
  late DisplayApi _displayApi;

  DisplayRepositoryImpl(this._remoteApi, this._mockApi) {
    () async {
      // var dataSource = (await DisplayDao().getDataSource())?.dataSource ?? 0;
      var source = Hive.box('settings').get('source');
      print(source);
      _displayApi = source == 0 ? _remoteApi : _mockApi;
    }();
  }

  @override
  Future<List<Collection>> getCollectionsByStoreType({
    required String storeType,
    Map<String, String>? queries,
  }) async {
    final response =
        await _displayApi.getCollectionsByStoreType(storeType: storeType);

    return response.map((collectionDto) => collectionDto.toModel()).toList();
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

    return response.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> clearCartList() async {
    final displayDao = DisplayDao();

    await displayDao.clearCarts();
  }

  @override
  Future<void> deleteCart(List<String> productIds) async {
    final displayDao = DisplayDao();

    await displayDao.deleteCart(productIds);
  }

  @override
  Future<void> changeCartQuantity({
    required String productId,
    required int qty,
  }) async {
    final displayDao = DisplayDao();
    await displayDao.changeQtyCart(productId, qty);
  }
}
