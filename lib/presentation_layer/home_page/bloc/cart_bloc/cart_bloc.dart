import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/add_cart.usecase.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

enum CartStatus { close, loading, success, open, failure }

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._displayUsecase) : super(CartState()) {
    on<CartInitialized>(_onCartInitialized);
    on<CartOpened>(_onCartOpened);
    on<CartClosed>(_onCartClosed);
    on<CartAdded>(_onCartAdded);
    on<CartResponse>(_onCartResponse);
    on<CartQuantityIncreased>(_onCartQuantityIncreased);
    on<CartQuantityDecreased>(_onCartQuantityDecreased);
  }

  final DisplayUsecase _displayUsecase;

  Future<void> _onCartInitialized(
      CartInitialized event, Emitter<CartState> emit) async {}

  Future<void> _onCartOpened(CartOpened event, Emitter<CartState> emit) async {
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
      emit(state.copyWith(status: CartStatus.close));
    } catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onCartQuantityIncreased(
      CartQuantityIncreased event, Emitter<CartState> emit) async {
    final quantity = state.quantity + 1;
    final totalPrice = state.productInfo.price * quantity;
    emit(state.copyWith(quantity: quantity, totalPrice: totalPrice));
  }

  Future<void> _onCartQuantityDecreased(
      CartQuantityDecreased event, Emitter<CartState> emit) async {
    final quantity = state.quantity - 1;
    if (quantity <= 0) return;
    final totalPrice = state.productInfo.price * quantity;
    emit(state.copyWith(quantity: quantity, totalPrice: totalPrice));
  }

  Future<void> _onCartAdded(CartAdded event, Emitter<CartState> emit) async {
    if (!state.status.isOpen) return;
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final cart = Cart(quantity: state.quantity, product: state.productInfo);
      await Future.delayed(Duration(seconds: 2));
      await _displayUsecase.fetch(AddCart(cart: cart));
      emit(state.copyWith(status: CartStatus.success));
    } catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onCartResponse(
      CartResponse event, Emitter<CartState> emit) async {
    final isAdded = event.isAdded ?? false;

    if (!isAdded) {
      emit(state.copyWith(status: CartStatus.close));
      return;
    }

    // emit(state.copyWith(
    //   status: CartStatus.close,
    //   productInfo: state.productInfo,
    //   quantity: state.quantity,
    // ));

    try {} catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }
}

// extensions

extension IntEx on int {
  String toWon() {
    final priceFormat = NumberFormat('###,###,###,###원');
    return priceFormat.format(this);
  }
}

extension CartStatusEx on CartStatus {
  bool get isClose => this == CartStatus.close;

  bool get isLoading => this == CartStatus.loading;

  bool get isSuccess => this == CartStatus.success;

  bool get isOpen => this == CartStatus.open;

  bool get isFailure => this == CartStatus.failure;
}
