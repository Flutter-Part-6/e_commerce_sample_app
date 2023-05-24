import 'package:flutter/material.dart';

class CartResponseProducts extends StatelessWidget {
  const CartResponseProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: ColoredBox(
        color: Colors.grey,
        child: Center(
          child: Text('추천 구매 상품 리스트'),
        ),
      ),
    );
  }
}
