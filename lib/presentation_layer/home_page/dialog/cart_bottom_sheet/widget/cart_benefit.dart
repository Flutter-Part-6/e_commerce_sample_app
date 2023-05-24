import 'package:flutter/material.dart';

class CartBenefit extends StatelessWidget {
  const CartBenefit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        alignment: Alignment.centerRight,
        child: const Text(
          '로그인 후, 할인 및 적립 혜택 적용',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
