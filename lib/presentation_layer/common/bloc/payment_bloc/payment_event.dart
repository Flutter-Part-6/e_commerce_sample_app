part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class PayMoney extends PaymentEvent {
  final ProductInfo productInfo;
  final BuildContext context;

  PayMoney({
    required this.productInfo,
    required this.context,
  });
}
