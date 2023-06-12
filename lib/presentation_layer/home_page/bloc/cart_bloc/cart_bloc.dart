import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

enum CartStatus { close, open, failure }

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final DisplayUsecase _displayUsecase;

  CartBloc(this._displayUsecase) : super(CartState()) {
    on<CartInitialized>(_onCartInitialized);
    on<CartOpened>(_onCartOpened);
    on<CartClosed>(_onCartClosed);
    on<CartQuantityIncreased>(_onCartQuantityIncreased);
    on<CartQuantityDecreased>(_onCartQuantityDecreased);
  }

  _onCartInitialized(
    CartInitialized event,
    Emitter<CartState> emit,
  ) {}

  Future<void> _onCartOpened(CartOpened event, Emitter<CartState> emit) async {
    if (state.status.isOpen) return;

    final productInfo = event.productInfo;
    final quantity = event.quantity;
    final totalPrice = productInfo.price * quantity;

    try {
      emit(state.copyWith(
        status: CartStatus.open,
        productInfo: productInfo,
        quantity: quantity,
        totalPrice: totalPrice,
      ));
    } catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onCartClosed(CartClosed event, Emitter<CartState> emit) async {
    try {
      if (state.status.isClose) return;
      emit(state.copyWith(status: CartStatus.close));
    } catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onCartQuantityIncreased(
    CartQuantityIncreased event,
    Emitter<CartState> emit,
  ) async {
    final quantity = state.quantity + 1;
    if (quantity > 999) return;
    final totalPrice = state.productInfo.price * quantity;
    emit(state.copyWith(quantity: quantity, totalPrice: totalPrice));
  }

  Future<void> _onCartQuantityDecreased(
    CartQuantityDecreased event,
    Emitter<CartState> emit,
  ) async {
    final quantity = state.quantity - 1;
    if (quantity <= 0) return;
    final totalPrice = state.productInfo.price * quantity;
    emit(state.copyWith(quantity: quantity, totalPrice: totalPrice));
  }
}

// extensions
extension IntEx on int {
  String toWon() {
    final priceFormat = NumberFormat('###,###,###,###원');

    return priceFormat.format(this);
  }

  String toReview() {
    return this > 9999 ? '9999+' : toString();
  }
}

extension CartStatusEx on CartStatus {
  bool get isClose => this == CartStatus.close;

  bool get isOpen => this == CartStatus.open;

  bool get isFailure => this == CartStatus.failure;
}
