import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/cart_list_page/component/cart_product_card/cart_product_card.dart';

import '../../common/constants.dart';
import '../../common/dependency_injection/dependency_injection.dart';
import '../common/bloc/payment_bloc/payment_bloc.dart';
import '../common/component/app_bar/widget/icon_box.dart';
import '../common/component/paymoney_button.dart';
import 'component/cart_total_price/cart_total_price.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CartListBloc>(context)..add(CartListGetList()),
      child: const CartListView(),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartListBloc = context.read<CartListBloc>();

    return BlocProvider(
      create: (_) => getIt<PaymentBloc>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconBox(
            icon: Icons.close,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
          title: const Text('장바구니'),
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CartListBloc, CartListState>(
                      builder: (context, state) {
                        final selectedProducts = state.selectedProduct;
                        final cartList = state.cartList;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Icon(
                                (selectedProducts.length == cartList.length)
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline_rounded,
                                size: 20,
                                color: (selectedProducts.length ==
                                            cartList.length &&
                                        cartList.length != 0)
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                              ),
                              onTap: () =>
                                  cartListBloc.add(CartListSelectedAll()),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '전체 선택 (${selectedProducts.length}/${cartList.length})',
                            ),
                          ],
                        );
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Text('전체 삭제'),
                      ),
                      onTap: () => cartListBloc.add(CartListCleared()),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 10),
              BlocBuilder<CartListBloc, CartListState>(
                builder: (context, state) {
                  switch (state.status) {
                    case Status.initial:
                      return Container(
                        height: 300,
                        child: const Center(
                          child: Text('init'),
                        ),
                      );
                    case Status.success:
                      return Column(
                        children: [
                          ...state.cartList
                              .map((cart) => CartProductCard(cart: cart))
                              .toList(),
                          const CartTotalPrice(),
                        ],
                      );
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Status.error:
                      return Container(
                        height: 300,
                        child: const Center(
                          child: Text('error'),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: BlocBuilder<CartListBloc, CartListState>(
            builder: (context, state) {
              List<Cart> selectedCartList = state.cartList.fold(
                [],
                (previousValue, cart) {
                  final List<Cart> currentValue = [...previousValue];

                  if (state.selectedProduct.contains(cart.product.productId)) {
                    currentValue.add(cart);
                  }

                  return currentValue;
                },
              );

              return state.status.isSuccess
                  ? PaymentButton(
                      selectedCartList: selectedCartList,
                      totalPrice: state.totalPrice,
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
