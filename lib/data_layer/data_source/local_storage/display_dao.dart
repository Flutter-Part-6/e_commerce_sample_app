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
    await localStorage.add(cart);
  }

  Future<List<CartEntity>> getCartList() async {
    final localStorage = await Hive.openBox<CartEntity>(cartDb);

    final List<CartEntity> cartList = localStorage.values.toList();

    return cartList;
  }
}
