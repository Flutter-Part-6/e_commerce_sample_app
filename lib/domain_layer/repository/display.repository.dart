import '../../common/utils/result/result.dart';
import '../model/display.model.dart';
import 'repository.dart';

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

  Future<Result<bool>> addCart({required Cart cart});

  Future<Result<bool>> deleteCart(List<String> productIds);

  Future<Result<bool>> clearCartList();

  Future<Result<bool>> changeCartQuantity({
    required String productId,
    required int qty,
  });

  // 장바구니 리스트 불러오기
  Future<Result<List<Cart>>> getCartList();
}
