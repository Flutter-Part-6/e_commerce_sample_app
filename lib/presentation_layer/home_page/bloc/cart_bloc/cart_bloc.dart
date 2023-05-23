import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/add_cart.usecase.dart';

import '../../../../domain_layer/model/display/product_info/product_info.model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

enum CartStatus { initial, loading, success, failure }

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._displayUsecase) : super(CartState()) {
    on<CartInitialized>(_onCartInitialized);
    on<CartRequested>(_onCartRequested);
    on<CartAdded>(_onCartAdded);
  }

  final DisplayUsecase _displayUsecase;

  Future<void> _onCartInitialized(
      CartInitialized event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.initial));
  }

  Future<void> _onCartRequested(
      CartRequested event, Emitter<CartState> emit) async {
    final productInfo = event.productInfo;
    final quantity = event.quantity;

    try {
      emit(state.copyWith(
        status: CartStatus.loading,
        productInfo: productInfo,
        quantity: quantity,
      ));
    } catch (error) {
      log('[error] $error');
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onCartAdded(CartAdded event, Emitter<CartState> emit) async {
    final canAdd = event.canAdd;

    if (!canAdd) {
      emit(state.copyWith(
        status: CartStatus.success,
        productInfo:
            const ProductInfo(title: '', imageUrl: '', price: 0, subtitle: ''),
        quantity: 1,
      ));
      print('[test] 장바구니 닫힘');
      return;
    }

    final cart = Cart(quantity: state.quantity, product: state.productInfo);
    await _displayUsecase.fetch(AddCart(cart: cart));
    print('[test] 장바구니 담기 성공');

    emit(state.copyWith(
      status: CartStatus.success,
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
  bool get isInitial => this == CartStatus.initial;

  bool get isLoading => this == CartStatus.loading;

  bool get isSuccess => this == CartStatus.success;

  bool get isFailure => this == CartStatus.failure;
}
