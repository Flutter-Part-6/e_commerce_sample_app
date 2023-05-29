import 'package:hive/hive.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';

const String cartDb = 'CART_DB';

class DisplayDao {
  Future<List<ViewModuleEntity>> getViewModules(String key) async {
    final localStorage = await Hive.openBox<ViewModuleEntity>(key);

    final List<ViewModuleEntity> viewModules = localStorage.values.toList();

    return viewModules;
  }

  Future<void> clearViewModules(String key) async {
    final localStorage = await Hive.openBox<ViewModuleEntity>(key);

    await localStorage.clear();
  }

  Future<void> insertViewModules(
    String key,
    List<ViewModuleEntity> viewModules,
  ) async {
    final localStorage = await Hive.openBox<ViewModuleEntity>(key);

    await localStorage.addAll(viewModules);
  }

  /// 장바구니 담기
  Future<void> insertCarts(CartEntity cart) async {
    final localStorage = await Hive.openBox<CartEntity>(cartDb);
    final productId = cart.product.productId;
    if (localStorage.get(productId) != null) {
      print('쨔스');
      return;
    }

    await localStorage.put(productId, cart);
  }

  Future<void> changeQtyCart(String productId, int qty) async {
    final localStorage = await Hive.openBox<CartEntity>(cartDb);
    final curCart = localStorage.get(productId);
    if (curCart == null) return;
    final nextCart = CartEntity(product: curCart.product, quantity: qty);
    await localStorage.put(productId, nextCart);
  }

  // 장바구니에 담긴 상품 삭제 by productId
  Future<void> deleteCart(String productId) async {
    final localStorage = await Hive.openBox<CartEntity>(cartDb);
    await localStorage.delete(productId);
  }

  Future<void> clearCarts() async {
    final localStorage = await Hive.openBox<CartEntity>(cartDb);
    await localStorage.clear();
  }

  Future<List<CartEntity>> getCartList() async {
    final localStorage = await Hive.openBox<CartEntity>(cartDb);

    final List<CartEntity> cartList = localStorage.values.toList();

    return cartList;
  }
}
