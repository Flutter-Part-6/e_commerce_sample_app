import 'package:hive/hive.dart';

import '../../common/mapper/display.mapper.dart';
import '../../dto/response_wrapper/response_wrapper.dart';
import '../../entity/display/display.entity.dart';
import '../../../domain_layer/model/display.model.dart';

const String _cartDb = 'CART_DB';

class DisplayDao {
  Future<List<ViewModule>> getViewModules(String key, int page) async {
    final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

    final ViewModuleListEntity? result = await localStorage.get(page);
    if (result == null) return [];

    return result.viewModules.map((e) => e.toModel()).toList();
  }

  Future<void> insertViewModules(
    String key,
    int page,
    ViewModuleListEntity viewModules,
  ) async {
    final localStorage = await Hive.openBox<ViewModuleListEntity>(key);
    await localStorage.put(page, viewModules);
  }

  Future<void> clearViewModules(String key) async {
    final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

    await localStorage.clear();
  }

  Future<void> deleteViewModules(String key, int page) async {
    final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

    await localStorage.delete(page);
  }

  /// 장바구니 담기
  Future<ResponseWrapper> insertCarts(CartEntity cart) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    final productId = cart.product.productId;
    if (localStorage.get(productId) != null) {
      final status = '이미 존재하는 상품입니다. ::: ${cart.product.title}';
      final code = 'CART-0000';
      final message = '이미 장바구니에 존재하는 상품입니다.';

      return ResponseWrapper(
        status: status,
        code: code,
        message: message,
      );
    }

    await localStorage.put(productId, cart);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 담기 성공',
    );
  }

  Future<ResponseWrapper> changeQtyCart(String productId, int qty) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    final curCart = localStorage.get(productId);
    if (curCart == null) {
      final status = '장바구니 인스턴스가 존재하지 않습니다.';
      final code = 'CART-0001';
      final message = '네트워크 오류가 발생했습니다. 잠시 후에 다시 시도해주세요.';

      return ResponseWrapper(
        status: status,
        code: code,
        message: message,
      );
    }
    ;
    final nextCart = CartEntity(product: curCart.product, quantity: qty);
    await localStorage.put(productId, nextCart);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 갯수 변경 성공',
    );
  }

  // 장바구니에 담긴 상품 삭제 by productId
  Future<ResponseWrapper> deleteCart(List<String> productIds) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    await localStorage.deleteAll(productIds);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 $productIds 해당상품 삭제 성공',
    );
  }

  Future<ResponseWrapper> clearCarts() async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    await localStorage.clear();

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 전체 삭제 성공',
    );
  }

  Future<ResponseWrapper<List<CartEntity>>> getCartList() async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 리스트 불러오기 성공',
      data: localStorage.values.toList(),
    );
  }
}
