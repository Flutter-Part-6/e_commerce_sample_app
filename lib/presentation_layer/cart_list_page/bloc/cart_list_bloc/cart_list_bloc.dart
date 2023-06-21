import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain_layer/usecase/display.usecase.dart';
import '../../../../domain_layer/usecase/display/cart/change_cart_qty_by_product_id.usecase.dart';
import '../../../../domain_layer/usecase/display/cart/clear_cart_list.usecase.dart';
import '../../../../domain_layer/usecase/display/cart/delete_cart_by_product_id.usecase.dart';
import '../../../../domain_layer/usecase/display/cart/get_cart_list.usecase.dart';
import '../../../../common/constants.dart';
import '../../../../common/utils/exceptions/service_exception.dart';
import '../../../../common/utils/logger.dart';
import '../../../../domain_layer/model/display/cart/cart.model.dart';
import '../../../../domain_layer/model/display/product_info/product_info.model.dart';
import '../../../../domain_layer/usecase/display/cart/add_cart.usecase.dart';

part 'cart_list_event.dart';

part 'cart_list_state.dart';

part 'cart_list_bloc.freezed.dart';

@injectable
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final DisplayUsecase _displayUsecase;

  CartListBloc(this._displayUsecase) : super(CartListState()) {
    on<CartListInitialized>(_onCartListInitialized);
    on<CartListGetList>(_onCartListGetList);
    on<CartListAdded>(_onCartListAdded);
    on<CartListDeleted>(_onCartDeleted);
    on<CartListCleared>(_onCartListCleared);
    on<CartListSelectedAll>(_onCartSelectedAll);
    on<CartListSelected>(_onCartSelected);
    on<CartListQtyIncreased>(_onCartQtyIncreased);
    on<CartListQtyDecreased>(_onCartQtyDecreased);
  }

  Future<void> _onCartListInitialized(
    CartListInitialized event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());
      final selectedProducts =
          cartList.map((e) => e.product.productId).toList();

      final totalPrice = _calTotalPrice(selectedProducts, cartList);

      emit(
        state.copyWith(
          status: Status.success,
          cartList: cartList,
          selectedProduct: selectedProducts,
          totalPrice: totalPrice,
        ),
      );
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onCartListGetList(
    CartListGetList event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());

      emit(
        state.copyWith(
          status: Status.success,
          cartList: cartList,
        ),
      );
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onCartSelectedAll(
    CartListSelectedAll event,
    Emitter<CartListState> emit,
  ) async {
    try {
      // 이미 전체 선택이 되어있는 경우 -> 모두 지움

      if (state.selectedProduct.length == state.cartList.length) {
        final totalPrice = _calTotalPrice([], state.cartList);
        emit(state.copyWith(selectedProduct: [], totalPrice: totalPrice));

        return;
      }

      final selectedProducts =
          state.cartList.map((e) => e.product.productId).toList();
      final totalPrice = _calTotalPrice(selectedProducts, state.cartList);

      emit(state.copyWith(
        selectedProduct: selectedProducts,
        totalPrice: totalPrice,
      ));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  void _onCartSelected(
    CartListSelected event,
    Emitter<CartListState> emit,
  ) {
    try {
      final String productId = event.cart.product.productId;
      final selectedProducts = [...state.selectedProduct];
      final int selectedIdx =
          state.selectedProduct.indexWhere((element) => element == productId);
      if (selectedIdx == -1) {
        selectedProducts.add(productId);
      } else {
        selectedProducts.removeAt(selectedIdx);
      }

      final totalPrice = _calTotalPrice(selectedProducts, state.cartList);

      emit(state.copyWith(
        selectedProduct: selectedProducts,
        totalPrice: totalPrice,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onCartQtyIncreased(
    CartListQtyIncreased event,
    Emitter<CartListState> emit,
  ) async {
    try {
      final productId = event.cart.product.productId;
      final qty = event.cart.quantity + 1;
      await _displayUsecase.fetch(
        ChangeCartQtyByProductIdAndQty(productId: productId, qty: qty),
      );
      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());
      final totalPrice = _calTotalPrice(state.selectedProduct, cartList);

      emit(state.copyWith(cartList: cartList, totalPrice: totalPrice));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onCartQtyDecreased(
    CartListQtyDecreased event,
    Emitter<CartListState> emit,
  ) async {
    try {
      final productId = event.cart.product.productId;
      final qty = event.cart.quantity - 1;
      if (qty < 1) return;
      await _displayUsecase.fetch(
        ChangeCartQtyByProductIdAndQty(productId: productId, qty: qty),
      );
      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());
      final totalPrice = _calTotalPrice(state.selectedProduct, cartList);

      emit(state.copyWith(cartList: cartList, totalPrice: totalPrice));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onCartDeleted(
    CartListDeleted event,
    Emitter<CartListState> emit,
  ) async {
    try {
      await _displayUsecase
          .fetch(DeleteCartByProductId(productIds: event.productIds));

      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());
      final selectedProducts =
          cartList.map((e) => e.product.productId).toList();
      final totalPrice = _calTotalPrice(selectedProducts, cartList);

      emit(state.copyWith(
        cartList: cartList,
        selectedProduct: selectedProducts,
        totalPrice: totalPrice,
      ));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onCartListCleared(
    CartListCleared event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _displayUsecase.fetch(ClearCartList());
      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());
      final List<String> selectedProducts =
          cartList.map((e) => e.product.productId).toList();

      emit(state.copyWith(
        status: Status.success,
        cartList: cartList,
        selectedProduct: selectedProducts,
        totalPrice: 0,
      ));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  int _calTotalPrice(List<String> ids, List<Cart> carts) {
    int price = 0;
    for (final id in ids) {
      for (final cart in carts) {
        if (cart.product.productId == id) {
          price += cart.quantity * cart.product.price;
        }
      }
    }

    return price;
  }

  Future<void> _onCartListAdded(
    CartListAdded event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final cart = Cart(quantity: event.quantity, product: event.productInfo);
      await Future.delayed(const Duration(milliseconds: 400));
      final bool result = await _displayUsecase.fetch(AddCart(cart: cart));
      CustomLogger.logger.d(result);
      final List<Cart> cartList = await _displayUsecase.fetch(GetCartList());
      final selectedProducts = [...state.selectedProduct];
      final productId = event.productInfo.productId;
      if (selectedProducts.indexWhere((e) => e == productId) == -1) {
        selectedProducts.add(productId);
      }
      final totalPrice = _calTotalPrice(selectedProducts, cartList);

      emit(
        state.copyWith(
          status: Status.success,
          cartList: cartList,
          selectedProduct: selectedProducts,
          totalPrice: totalPrice,
        ),
      );
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      CustomLogger.logger.e('${error.toString()}');
    }
  }
}
