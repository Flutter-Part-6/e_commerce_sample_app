import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

import '../../../../domain_layer/model/display/cart/cart.model.dart';
import '../../../common/component/app_bar/widget/icon_box.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({required this.cart, Key? key}) : super(key: key);
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final selectedList = context.watch<CartListBloc>().state.selectedProduct;
    final bool isSelected = selectedList.contains(cart.product.productId);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context
                        .read<CartListBloc>()
                        .add(CartListSelected(cart: cart)),
                    child: Icon(
                      (isSelected)
                          ? Icons.check_circle
                          : Icons.check_circle_outline_rounded,
                      size: 20,
                      color: (isSelected) ? Colors.purple : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(cart.product.title),
                ],
              ),
              GestureDetector(
                onTap: () => context.read<CartListBloc>().add(
                      CartListDeleted(
                        productIds: [
                          cart.product.productId,
                        ],
                      ),
                    ),
                child: const Icon(Icons.close, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        cart.product.imageUrl,
                        height: 75,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cart.product.price.toWon(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconBox(
                                  icon: Icons.remove,
                                  color: Colors.black,
                                  onPressed: () => context
                                      .read<CartListBloc>()
                                      .add(CartListQtyDecreased(cart: cart)),
                                ),
                                Text(cart.quantity.toString()),
                                IconBox(
                                  icon: Icons.add,
                                  color: Colors.black,
                                  onPressed: () => context
                                      .read<CartListBloc>()
                                      .add(CartListQtyIncreased(cart: cart)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
