import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/presentation_layer/common/component/app_bar/widget/icon_box.dart';

import '../../bloc/cart_bloc/cart_bloc.dart';

//TODO 왜 안에 빌더한번 더 넣었는지 알려줄수 있도록 공부해야함
Future<bool?> cartBottomSheet(BuildContext context) {
  final cartBloc = context.read<CartBloc>();
  final priceFormat = NumberFormat('###,###,###,###원');

  return showModalBottomSheet<bool>(
      showDragHandle: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      context: context,
      builder: (_) {
        return BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current.status.isSuccess,
          listener: (ctx, state) {
            if (context.canPop()) {
              Navigator.pop(context, true);
            }
          },
          builder: (ctx, state) {
            final state = cartBloc.state;
            final productInfo = state.productInfo;
            final quantity = state.quantity;
            final price = priceFormat.format(productInfo.price);
            final totalPrice = priceFormat.format(state.totalPrice);

            return SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          productInfo.imageUrl,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productInfo.title),
                            const SizedBox(height: 4),
                            Text(
                              productInfo.subtitle,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 1, color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productInfo.title),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  price,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconBox(
                                    icon: Icons.remove,
                                    color: Colors.black,
                                    onPressed: () =>
                                        cartBloc.add(CartQuantityDecreased()),
                                  ),
                                  Text(quantity.toString()),
                                  IconBox(
                                    icon: Icons.add,
                                    color: Colors.black,
                                    onPressed: () =>
                                        cartBloc.add(CartQuantityIncreased()),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(height: 1, color: Colors.grey),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        '로그인 후, 할인 및 적립 혜택 적용',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () => cartBloc.add(CartAdded()),
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue),
                        child: (state.status.isLoading)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                            : Text(
                                '$totalPrice 장바구니 담기',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      });
}
