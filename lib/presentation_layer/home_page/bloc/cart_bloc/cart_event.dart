part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class CartInitialized extends CartEvent {}

class CartRequested extends CartEvent {
  CartRequested(this.productInfo, {this.quantity = 1});

  final ProductInfo productInfo;
  final int quantity;
}

class CartAdded extends CartEvent {
  CartAdded(this.canAdd);

  final bool canAdd;
}

class CartQuantityIncreased extends CartEvent {}

class CartQuantityDecreased extends CartEvent {}
