import 'package:hive/hive.dart';
import 'package:sample_app/common/utils/logger.dart';
import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';

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
    CustomLogger.logger.d('data insert');
  }

  Future<void> clearViewModules(String key) async {
    final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

    await localStorage.clear();
    CustomLogger.logger.d('data clear');
  }

  Future<void> deleteViewModules(String key, int page) async {
    final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

    await localStorage.delete(page);
    CustomLogger.logger.d('delete before data');
  }

  /// 장바구니 담기
  Future<void> insertCarts(CartEntity cart) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    final productId = cart.product.productId;
    if (localStorage.get(productId) != null) {
      print('[test] 이미 존재하는 상품입니다. ::: ${cart.product.title}');

      return;
    }

    await localStorage.put(productId, cart);
  }

  Future<void> changeQtyCart(String productId, int qty) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    final curCart = localStorage.get(productId);
    if (curCart == null) return;
    final nextCart = CartEntity(product: curCart.product, quantity: qty);
    await localStorage.put(productId, nextCart);
  }

  // 장바구니에 담긴 상품 삭제 by productId
  Future<void> deleteCart(List<String> productIds) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    await localStorage.deleteAll(productIds);
  }

  Future<void> clearCarts() async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    await localStorage.clear();
  }

  Future<List<CartEntity>> getCartList() async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);

    return localStorage.values.toList();
  }
}
