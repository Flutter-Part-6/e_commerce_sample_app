import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';

class CommonSnackBar {
  CommonSnackBar();

  static addCartSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.add_shopping_cart, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              '상품을 장바구니에 담았습니다.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: EdgeInsets.only(left: 16, top: 10, right: 14, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          textColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          label: '장바구니 보기',
          onPressed: () => context.push(Routes.cartPath),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
