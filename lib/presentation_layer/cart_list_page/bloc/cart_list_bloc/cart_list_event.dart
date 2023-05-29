part of 'cart_list_bloc.dart';

abstract class CartListEvent {
  const CartListEvent();
}

class CartListInitialized extends CartListEvent {
  CartListInitialized();
}

class CartListAdded extends CartListEvent {
  final int quantity;
  final ProductInfo productInfo;

  CartListAdded({required this.quantity, required this.productInfo});
}

class CartListDeleted extends CartListEvent {
  final String productId;

  CartListDeleted({required this.productId});
}

class CartListCleared extends CartListEvent {
  CartListCleared();
}

class CartListSelectedAll extends CartListEvent {
  CartListSelectedAll();
}

class CartListSelected extends CartListEvent {
  CartListSelected({required this.cart});

  final Cart cart;
}

class CartListQtyDecreased extends CartListEvent {
  CartListQtyDecreased({required this.cart});

  final Cart cart;
}

class CartListQtyIncreased extends CartListEvent {
  CartListQtyIncreased({required this.cart});

  final Cart cart;
}
