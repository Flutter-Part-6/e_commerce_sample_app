part of 'cart_list_bloc.dart';

@freezed
class CartListState with _$CartListState {
  factory CartListState({
    @Default(CartListStatus.initial) CartListStatus status,
    @Default(<Cart>[]) List<Cart> cartList,
  }) = _CartListState;
}
