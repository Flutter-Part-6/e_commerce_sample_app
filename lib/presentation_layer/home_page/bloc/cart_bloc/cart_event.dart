part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class CartInitialized extends CartEvent {}

class CartOpened extends CartEvent {
  final ProductInfo productInfo;
  final int quantity;

  CartOpened(this.productInfo, {this.quantity = 1});
}

class CartClosed extends CartEvent {
  CartClosed();
}

class CartAdded extends CartEvent {
  CartAdded();
}

class CartResponse extends CartEvent {
  final bool? isAdded;

  CartResponse(this.isAdded);
}

class CartQuantityIncreased extends CartEvent {}

class CartQuantityDecreased extends CartEvent {}
