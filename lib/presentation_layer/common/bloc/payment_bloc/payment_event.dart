part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class PayMoney extends PaymentEvent {
  final List<ProductInfo> productInfoList;
  final BuildContext context;

  PayMoney({
    required this.productInfoList,
    required this.context,
  });
}
