part of 'cart_list_bloc.dart';

abstract class CartListEvent {
  const CartListEvent();
}

class CartListInitialized extends CartListEvent {
  CartListInitialized();
}
