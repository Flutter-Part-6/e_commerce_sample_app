/// data_source
import '../data_source/local_storage/display_dao.dart';
import '../data_source/mock/moc_api.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';

/// Model & Mapper
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';
import '../../common/utils/result/result.dart';

// Exceptions
import 'package:sample_app/common/utils/exceptions/base_exception.dart';
import 'package:sample_app/common/utils/exceptions/service_exception.dart';

// Utils
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/common/utils/extensions.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  // final DisplayApi _displayApi;

  final MockApi _displayApi;
  final DisplayDao _displayDao;

  DisplayRepositoryImpl(this._displayApi, this._displayDao);

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
          ServiceException(
            code: response.code,
            status: response.status,
            message: response.message,
          ),
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
      final cacheKey = '${storeType}_${tabId}';

      if (isRefresh) {
        // delete cache
        await _displayDao.clearViewModules(cacheKey);
      }

      final List<ViewModule> cachedViewModules =
          await _displayDao.getViewModules(cacheKey, page);

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
      await _displayDao.deleteViewModules(cacheKey, page);

      // insert data
      await _displayDao.insertViewModules(
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
    try {
      await _displayDao.insertCarts(cart.toEntity());
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<List<Cart>> getCartList() async {
    try {
      final response = await _displayDao.getCartList();

      return response.map((e) => e.toModel()).toList();
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<void> clearCartList() async {
    try {
      await _displayDao.clearCarts();
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<void> deleteCart(List<String> productIds) async {
    try {
      await _displayDao.deleteCart(productIds);
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<void> changeCartQuantity({
    required String productId,
    required int qty,
  }) async {
    try {
      await _displayDao.changeQtyCart(productId, qty);
    } catch (error) {
      throw BaseException.setException(error);
    }
  }
}
