import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

import '../../../../common/utils/exceptions/network_exception.dart';
import '../../../../common/utils/exceptions/service_exception.dart';
import '../../../../common/utils/logger.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

enum CartStatus { close, open, error }

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

  void _onCartInitialized(
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
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: CartStatus.error));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: CartStatus.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  void _onCartClosed(CartClosed event, Emitter<CartState> emit) {
    try {
      if (state.status.isClose) return;
      emit(state.copyWith(status: CartStatus.close));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  void _onCartQuantityIncreased(
    CartQuantityIncreased event,
    Emitter<CartState> emit,
  ) {
    try {
      final quantity = state.quantity + 1;
      if (quantity > 999) return;
      final totalPrice = state.productInfo.price * quantity;
      emit(state.copyWith(quantity: quantity, totalPrice: totalPrice));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future<void> _onCartQuantityDecreased(
    CartQuantityDecreased event,
    Emitter<CartState> emit,
  ) async {
    try {
      final quantity = state.quantity - 1;
      if (quantity <= 0) return;
      final totalPrice = state.productInfo.price * quantity;
      emit(state.copyWith(quantity: quantity, totalPrice: totalPrice));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
      emit(state.copyWith(status: CartStatus.error));
    }
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

  bool get isError => this == CartStatus.error;
}
