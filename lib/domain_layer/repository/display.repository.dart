import '../../common/utils/result/result.dart';
import '../model/display.model.dart';
import 'repository.dart';

abstract class DisplayRepository extends Repository {
  // get menu list
  Future<Result<List<Menu>>> getMenusByMallType({
    required String mallType,
    Map<String, String>? queries,
  });

  // get viewModule list
  Future<Result<List<ViewModule>>> getViewModulesByMallTypeAndTabId({
    required bool isRefresh,
    required String mallType,
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
