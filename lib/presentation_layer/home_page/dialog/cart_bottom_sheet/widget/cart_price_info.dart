import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

import '../../../../common/component/app_bar/widget/icon_box.dart';

class CartPriceInfo extends StatelessWidget {
  const CartPriceInfo({required this.cartBloc, Key? key}) : super(key: key);
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final productInfo = cartBloc.state.productInfo;
    final quantity = cartBloc.state.quantity;

    return Padding(
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
                    productInfo.price.toWon(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBox(
                      icon: Icons.remove,
                      color: Colors.black,
                      onPressed: () => cartBloc.add(CartQuantityDecreased()),
                    ),
                    Text(quantity.toString()),
                    IconBox(
                      icon: Icons.add,
                      color: Colors.black,
                      onPressed: () => cartBloc.add(CartQuantityIncreased()),
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
    );
  }
}
