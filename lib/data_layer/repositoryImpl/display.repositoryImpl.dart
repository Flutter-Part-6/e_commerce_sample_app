/// data_source

import 'package:injectable/injectable.dart';
import 'package:sample_app/common/utils/exceptions/base_exception.dart';
import 'package:sample_app/common/utils/exceptions/service_exception.dart';
import 'package:sample_app/common/utils/extensions.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';

/// Model & Mapper
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';

import '../../common/utils/result/result.dart';
import '../data_source/local_storage/display_dao.dart';
import '../data_source/mock/moc_api.dart';

import 'package:dio/dio.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  // final DisplayApi _displayApi;

  final MockApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<Result<List<Collection>>> getCollectionsByStoreType({
    required String storeType,
    Map<String, String>? queries,
  }) async {
    try {
      final response =
          await _displayApi.getCollectionsByStoreType(storeType: storeType);

      if (response.status.isSuccess) {
        final List<Collection> collections =
            response.data?.map((dto) => dto.toModel()).toList() ?? [];

        return Result.success(collections);
      } else {
        return Result.error(
          ServiceException(code: response.code, message: response.message),
          response.message,
        );
      }
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<List<ViewModule>> getViewModulesByStoreTypeAndTabId({
    required bool isRefresh,
    required String storeType,
    required int tabId,
    required int page,
  }) async {
    try {
      final displayDao = DisplayDao();
      final cacheKey = '${storeType}_${tabId}';

      if (isRefresh) {
        // delete cache
        await displayDao.clearViewModules(cacheKey);
      }

      final List<ViewModule> cachedViewModules =
          await displayDao.getViewModules(cacheKey, page);

      if (cachedViewModules.isNotEmpty) {
        return cachedViewModules;
      }

      final response = await _displayApi.getViewModulesByStoreTypeAndTabId(
        storeType: storeType,
        tabId: tabId,
        page: page,
      );

      final List<ViewModule> viewModules =
          response.data?.map((dto) => dto.toModel()).toList() ?? [];

      // delete before data
      await displayDao.deleteViewModules(cacheKey, page);

      // insert data
      await displayDao.insertViewModules(
        cacheKey,
        page,
        ViewModuleListEntity(
          viewModules: viewModules.map((e) => e.toEntity()).toList(),
        ),
      );

      return viewModules;
    } catch (error) {
      throw BaseException.setException(error);
    }
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
