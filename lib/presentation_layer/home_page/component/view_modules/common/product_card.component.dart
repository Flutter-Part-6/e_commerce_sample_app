import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../../bloc/cart_bloc/cart_bloc.dart';

class ProductCardComponent extends StatelessWidget {
  final ProductInfo productInfo;

  const ProductCardComponent({
    Key? key,
    required this.productInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              productInfo.imageUrl,
              height: 160,
              width: 125,
            ),
            Container(
                color: Colors.black.withOpacity(0.2), height: 160, width: 125),
            Positioned(
              right: 5,
              bottom: 12,
              child: GestureDetector(
                onTap: () => context.read<CartBloc>().add(
                      CartOpened(productInfo),
                    ),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  height: 35,
                  width: 35,
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        Text(productInfo.title),
        Row(
          children: [
            Text('${productInfo.discountRate.toString()}%'),
            Text(productInfo.price.toWon()),
          ],
        ),
        Text(productInfo.originalPrice.toWon()),
        Row(
          children: [
            const Text('후기'),
            Text(productInfo.reviewCount.toReview()),
          ],
        ),
      ],
    );
  }
}
