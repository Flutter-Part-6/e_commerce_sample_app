part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class CartInitialized extends CartEvent {}

class CartOpened extends CartEvent {
  CartOpened(this.productInfo, {this.quantity = 1});

  final ProductInfo productInfo;
  final int quantity;
}

class CartClosed extends CartEvent {
  CartClosed();
}

class CartAdded extends CartEvent {
  CartAdded();
}

class CartResponse extends CartEvent {
  CartResponse(this.isAdded);

  final bool? isAdded;
}

class CartQuantityIncreased extends CartEvent {}

class CartQuantityDecreased extends CartEvent {}
