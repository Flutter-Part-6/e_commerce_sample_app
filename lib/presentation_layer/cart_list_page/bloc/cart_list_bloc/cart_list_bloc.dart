import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_cart_list.usecase.dart';

import '../../../../domain_layer/model/display/cart/cart.model.dart';

part 'cart_list_event.dart';

part 'cart_list_state.dart';

part 'cart_list_bloc.freezed.dart';

enum CartListStatus { initial, loading, success, failure }

@injectable
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final DisplayUsecase _displayUsecase;

  CartListBloc(this._displayUsecase) : super(CartListState()) {
    on<CartListInitialized>(_onCartListInitialized);
  }

  Future<void> _onCartListInitialized(
      CartListInitialized event, Emitter<CartListState> emit) async {
    emit(state.copyWith(status: CartListStatus.loading));

    try {
      final cartList = await _displayUsecase.fetch(GetCartList());
      emit(state.copyWith(status: CartListStatus.success, cartList: cartList));
    } catch (error) {
      emit(state.copyWith(status: CartListStatus.failure));
    }
  }
}
