part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  factory PaymentState({
    @Default(PaymentStatus.initial) PaymentStatus status,
    String? message,
  }) = _PaymentState;
}
