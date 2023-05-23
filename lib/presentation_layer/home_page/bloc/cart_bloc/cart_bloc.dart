import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/add_cart.usecase.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

enum CartStatus { close, loading, open, failure }

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._displayUsecase) : super(CartState()) {
    on<CartInitialized>(_onCartInitialized);
    on<CartRequested>(_onCartRequested);
    on<CartAdded>(_onCartAdded);
    on<CartQuantityIncreased>(_onCartQuantityIncreased);
    on<CartQuantityDecreased>(_onCartQuantityDecreased);
  }

  final DisplayUsecase _displayUsecase;

  Future<void> _onCartInitialized(
      CartInitialized event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.close));
  }

  Future<void> _onCartRequested(
      CartRequested event, Emitter<CartState> emit) async {
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
    final canAdd = event.canAdd;

    if (!canAdd) {
      emit(state.copyWith(status: CartStatus.close));
      return;
    }

    final cart = Cart(quantity: state.quantity, product: state.productInfo);
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(status: CartStatus.loading));
    await _displayUsecase.fetch(AddCart(cart: cart));

    emit(state.copyWith(
      status: CartStatus.close,
      productInfo: state.productInfo,
      quantity: state.quantity,
    ));

    try {} catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }
}

extension CartStatusEx on CartStatus {
  bool get isClose => this == CartStatus.close;

  bool get isLoading => this == CartStatus.loading;

  bool get isOpen => this == CartStatus.open;

  bool get isFailure => this == CartStatus.failure;
}
