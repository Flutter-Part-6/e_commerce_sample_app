import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/cart_list_page/component/cart_product_card/cart_product_card.dart';

import '../common/component/app_bar/widget/icon_box.dart';
import 'component/cart_total_price/cart_total_price.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconBox(
          icon: Icons.close,
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            }
          },
        ),
        title: const Text('장바구니'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                          onTap: () => context.read<CartListBloc>().add(
                                CartListSelectedAll(),
                              ),
                          child: Icon(
                            (selectedProducts.length == cartList.length)
                                ? Icons.check_circle
                                : Icons.check_circle_outline_rounded,
                            size: 20,
                            color: (selectedProducts.length == cartList.length)
                                ? Colors.purple
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '전체 선택 (${selectedProducts.length}/${cartList.length})',
                        )
                      ],
                    );
                  }),
                  GestureDetector(
                    onTap: () =>
                        context.read<CartListBloc>().add(CartListCleared()),
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      child: Text('전체 삭제'),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 10),
            BlocBuilder<CartListBloc, CartListState>(
              builder: (context, state) {
                switch (state.status) {
                  case CartListStatus.initial:
                    return Container(
                      height: 300,
                      child: const Center(
                        child: Text('init'),
                      ),
                    );
                  case CartListStatus.success:
                    return Column(
                      children: [
                        ...state.cartList
                            .map((cart) => CartProductCard(cart: cart))
                            .toList(),
                        const CartTotalPrice()
                      ],
                    );
                  case CartListStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case CartListStatus.failure:
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
    );
  }
}
