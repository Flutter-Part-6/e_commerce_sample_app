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
        vertical: 16,
        horizontal: 20,
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
                decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(color: Colors.grey),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                width: 100,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBox(
                      icon: Icons.remove,
                      onPressed: () => cartBloc.add(CartQuantityDecreased()),
                      color: Colors.black,
                    ),
                    Text(quantity.toString()),
                    IconBox(
                      icon: Icons.add,
                      onPressed: () => cartBloc.add(
                        CartQuantityIncreased(),
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}
