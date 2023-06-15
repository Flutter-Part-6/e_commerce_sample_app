/// data_source
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:sample_app/common/utils/exceptions/data_mapping_exception.dart';
import 'package:sample_app/common/utils/exceptions/network_exception.dart';
import 'package:sample_app/common/utils/extensions.dart';
import 'package:sample_app/common/utils/logger.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';

/// Model & Mapper
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';

import '../../common/utils/result/result.dart';
import '../data_source/local_storage/display_dao.dart';
import '../data_source/mock/moc_api.dart';
import '../entity/display/view_module/view_module.entity.dart';

import 'package:dio/dio.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  // final MockApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<Result<List<Collection>>> getCollectionsByStoreType({
    required String storeType,
    Map<String, String>? queries,
  }) async {
    try {
      final response =
          await _displayApi.getCollectionsByStoreType(storeType: storeType);
      final status = response.status;
      final code = response.code;
      final message = response.message;
      if (status.isSuccess) {
        final List<Collection> collections = response.data
                ?.map((collectionDto) => collectionDto.toModel())
                .toList() ??
            [];
        CustomLogger.logger.d(collections);

        return Result.success(collections);
      } else {
        return Result.error(Exception('service error'), 'serviceError');
      }
    } on DioError catch (error) {
      throw NetworkException(error);
    } on SocketException catch (error) {
      throw NetworkException(error);
    } catch (error) {
      return Result.error(
        Exception(),
        error.toString(),
      );
    }
  }

  @override
  Future<List<ViewModule>> getViewModulesByStoreTypeAndTabId({
    required bool isRefresh,
    required String storeType,
    required int tabId,
    required int page,
  }) async {
    // final displayDao = DisplayDao();
    //
    // final cacheKey = '${storeType}_${tabId}';
    // final List<ViewModuleEntity> cachedViewModules =
    //     await displayDao.getViewModules(cacheKey, page);

    // print('[test] cachedViewModules : $cachedViewModules');
    // //TODO refresh인 경우 개발해야 됌
    // if (cachedViewModules.isNotEmpty) {
    //   final viewModules = cachedViewModules
    //       .map((viewModuleEntity) => viewModuleEntity.toModel())
    //       .toList();
    //   print('[test] test cache');
    //
    //   return viewModules;
    // }

    final response = await _displayApi.getViewModulesByStoreTypeAndTabId(
      storeType: storeType,
      tabId: tabId,
      page: page,
    );

    print('[test] response : $response');

    return response.data
            ?.map((viewModuleDto) => viewModuleDto.toModel())
            .toList() ??
        [];
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
