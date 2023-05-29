part of 'cart_list_bloc.dart';

@freezed
class CartListState with _$CartListState {
  factory CartListState({
    @Default(CartListStatus.initial) CartListStatus status,
    @Default(<Cart>[]) List<Cart> cartList,
    @Default([]) List<String> selectedProduct,
    @Default(0) int totalPrice,
  }) = _CartListState;
}
