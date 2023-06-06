import 'package:flutter/material.dart';

import '../../../bloc/cart_bloc/cart_bloc.dart';

class CartResponseInfo extends StatelessWidget {
  const CartResponseInfo({required this.cartBloc, Key? key}) : super(key: key);
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final productInfo = cartBloc.state.productInfo;

    return Row(
      children: [
        Image.network(
          productInfo.imageUrl,
          width: 60,
          height: 60,
        ),
        const SizedBox(width: 10),
        const Text(
          '장바구니에 상품을 담았습니다.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
