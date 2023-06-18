import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/repository/repository.dart';

import '../../common/utils/result/result.dart';

abstract class DisplayRepository extends Repository {
  // get collection list
  Future<Result<List<Collection>>> getCollectionsByStoreType({
    required String storeType,
    Map<String, String>? queries,
  });

  // get viewModule list
  Future<Result<List<ViewModule>>> getViewModulesByStoreTypeAndTabId({
    required bool isRefresh,
    required String storeType,
    required int tabId,
    required int page,
    // Map<String, String>? queries,
  });

  //TODO response 만들어야 함
  Future<Result<bool>> addCart({required Cart cart});

  //TODO response 만들어야 함
  Future<Result<bool>> deleteCart(List<String> productIds);

  //TODO response 만들어야 함
  Future<Result<bool>> clearCartList();

  //TODO response 만들어야 함
  Future<Result<bool>> changeCartQuantity({
    required String productId,
    required int qty,
  });

  // 장바구니 리스트 불러오기
  Future<Result<List<Cart>>> getCartList();
}
