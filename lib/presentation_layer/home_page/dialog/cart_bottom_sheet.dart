import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/cart_bloc/cart_bloc.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  final state = context.read<CartBloc>().state;
  final productInfo = state.productInfo;
  final quantity = state.quantity;

  return showModalBottomSheet<bool>(
    showDragHandle: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    context: context,
    builder: (BuildContext context) {
      final f = NumberFormat('###,###,###,###원');
      final price = f.format(productInfo.price);

      return SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(height: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productInfo.title),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(height: 1, color: Colors.grey),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  '로그인 후, 할인 및 적립 혜택 적용',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context, true);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  child: Text(
                    '$price 장바구니 담기',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
