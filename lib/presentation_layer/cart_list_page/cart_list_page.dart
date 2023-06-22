import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/constants.dart';
import '../../common/dependency_injection/dependency_injection.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/custom_theme.dart';
import '../../theme/typography.dart';
import '../common/bloc/payment_bloc/payment_bloc.dart';
import '../common/component/app_bar/widget/icon_box.dart';
import '../common/component/paymoney_button.dart';
import '../../domain_layer/model/display.model.dart';
import 'bloc/cart_list_bloc/cart_list_bloc.dart';
import 'component/cart_product_card/cart_product_card.dart';
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
          leading: Align(
            alignment: Alignment.center,
            child: IconBox(
              icon: AppIcons.close,
              iconSize: 24,
              color: Theme.of(context).colorScheme.contentPrimary,
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
            ),
          ),
          title: const Text('장바구니'),
          elevation: 0,
          backgroundColor: AppColors.white,
          titleTextStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.contentPrimary)
              .semiBold,
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
                              child: SvgPicture.asset(
                                (selectedProducts.length == cartList.length)
                                    ? AppIcons.checkMarkCircleFill
                                    : AppIcons.checkMarkCircle,
                                width: 28,
                                height: 28,
                                colorFilter: ColorFilter.mode(
                                  (selectedProducts.length == cartList.length &&
                                          cartList.length != 0)
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .contentFourth,
                                  BlendMode.srcIn,
                                ),
                              ),
                              onTap: () =>
                                  cartListBloc.add(CartListSelectedAll()),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '전체 선택 (${selectedProducts.length}/${cartList.length})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .contentPrimary,
                                  )
                                  .regular,
                            ),
                          ],
                        );
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Text(
                          '전체 삭제',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .contentSecondary,
                              )
                              .semiBold,
                        ),
                      ),
                      onTap: () => cartListBloc.add(CartListCleared()),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 8,
                thickness: 8,
                color: Theme.of(context).colorScheme.surface,
              ),
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
