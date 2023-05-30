part of 'payment_bloc.dart';

enum Status { initial, loading, success, error }

@freezed
class PaymentState with _$PaymentState {
  factory PaymentState({
    @Default(Status.initial) Status status,
  }) = _PaymentState;
}
