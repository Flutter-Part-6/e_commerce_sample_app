import 'package:injectable/injectable.dart';

import '../../common/utils/extensions.dart';
import '../../common/utils/exceptions/base_exception.dart';
import '../../common/utils/exceptions/service_exception.dart';
import '../data_source/local_storage/display_dao.dart';
import '../data_source/remote/display_api.dart';
import '../../domain_layer/repository/display.repository.dart';
import '../../domain_layer/model/display.model.dart';
import '../common/mapper/display.mapper.dart';
import '../entity/display/display.entity.dart';
import '../../common/utils/result/result.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  late DisplayApi _displayApi;
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
  Future<Result<List<ViewModule>>> getViewModulesByStoreTypeAndTabId({
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
        return Result.success(cachedViewModules);
      }

      final response = await _displayApi.getViewModulesByStoreTypeAndTabId(
        storeType: storeType,
        tabId: tabId,
        page: page,
      );

      if (response.status.isSuccess) {
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

        return Result.success(viewModules);
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
  Future<Result<bool>> addCart({required Cart cart}) async {
    try {
      final response = await _displayDao.insertCarts(cart.toEntity());

      return response.status.isSuccess
          ? Result.success(true)
          : Result.error(
              ServiceException(
                code: response.code,
                status: response.status,
                message: response.message,
              ),
              response.message,
            );
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<Result<List<Cart>>> getCartList() async {
    try {
      final response = await _displayDao.getCartList();

      return response.status.isSuccess
          ? Result.success(
              response.data?.map((e) => e.toModel()).toList() ?? [],
            )
          : Result.error(
              ServiceException(
                code: response.code,
                status: response.status,
                message: response.message,
              ),
              response.message,
            );
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<Result<bool>> clearCartList() async {
    try {
      final response = await _displayDao.clearCarts();

      return response.status.isSuccess
          ? Result.success(true)
          : Result.error(
              ServiceException(
                code: response.code,
                status: response.status,
                message: response.message,
              ),
              response.message,
            );
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<Result<bool>> deleteCart(List<String> productIds) async {
    try {
      final response = await _displayDao.deleteCart(productIds);

      return response.status.isSuccess
          ? Result.success(true)
          : Result.error(
              ServiceException(
                code: response.code,
                status: response.status,
                message: response.message,
              ),
              response.message,
            );
    } catch (error) {
      throw BaseException.setException(error);
    }
  }

  @override
  Future<Result<bool>> changeCartQuantity({
    required String productId,
    required int qty,
  }) async {
    try {
      final response = await _displayDao.changeQtyCart(productId, qty);

      return response.status.isSuccess
          ? Result.success(true)
          : Result.error(
              ServiceException(
                code: response.code,
                status: response.status,
                message: response.message,
              ),
              response.message,
            );
    } catch (error) {
      throw BaseException.setException(error);
    }
  }
}
