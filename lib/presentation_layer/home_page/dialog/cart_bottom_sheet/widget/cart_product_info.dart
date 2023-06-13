import 'package:flutter/material.dart';

import '../../../bloc/cart_bloc/cart_bloc.dart';

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({required this.cartBloc, Key? key}) : super(key: key);
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final productInfo = cartBloc.state.productInfo;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.network(
            productInfo.imageUrl,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productInfo.title,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  productInfo.subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
