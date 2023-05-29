part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  factory CartState({
    @Default(CartStatus.close) CartStatus status,
    @Default(ProductInfo(
      productId: '',
      title: '',
      imageUrl: '',
      subtitle: '',
      price: -1,
      originalPrice: -1,
      discountRate: -1,
      reviewCount: -1,
    ))
    ProductInfo productInfo,
    @Default(1) int quantity,
    @Default(0) int totalPrice,
  }) = _ViewModulesState;
}
