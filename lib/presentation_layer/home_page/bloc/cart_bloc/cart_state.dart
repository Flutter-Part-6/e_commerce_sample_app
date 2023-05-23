part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  factory CartState({
    @Default(CartStatus.close) CartStatus status,
    @Default(ProductInfo(
      title: '',
      imageUrl: '',
      subtitle: '',
      price: 0,
    ))
    ProductInfo productInfo,
    @Default(1) int quantity,
    @Default(0) int totalPrice,
  }) = _ViewModulesState;
}
