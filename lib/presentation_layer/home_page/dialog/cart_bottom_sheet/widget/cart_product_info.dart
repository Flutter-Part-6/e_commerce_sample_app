import 'package:flutter/material.dart';

import '../../../bloc/cart_bloc/cart_bloc.dart';

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({required this.cartBloc, Key? key}) : super(key: key);
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final productInfo = cartBloc.state.productInfo;

    return Padding(
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
    );
  }
}
