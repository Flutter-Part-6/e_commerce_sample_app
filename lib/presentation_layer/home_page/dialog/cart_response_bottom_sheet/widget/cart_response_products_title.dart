import 'package:flutter/material.dart';

class CartResponseProductsTitle extends StatelessWidget {
  const CartResponseProductsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        '다른 고객이 함께 구매한 상품',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
