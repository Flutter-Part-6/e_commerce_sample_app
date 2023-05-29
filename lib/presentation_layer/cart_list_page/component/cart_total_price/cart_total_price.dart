import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

class CartTotalPrice extends StatelessWidget {
  const CartTotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartListBloc, CartListState>(
      builder: (context, state) {
        if (state.cartList.isEmpty) {
          return Container(
            height: 400,
            child: Center(
              child: Text('장바구니에 담긴 상품이 없습니다'),
            ),
          );
        }
        return Column(
          children: [
            const Divider(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('상품금액'),
                      Text(state.totalPrice.toWon()),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('상품할인금액'), Text('0 원')],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '로그인 후 할인 금액 적용',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('상품 금액'), Text(state.totalPrice.toWon())],
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('결제예정금액'), Text(state.totalPrice.toWon())],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '쿠폰/적립금은 주문서에서 사용 가능합니다',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
