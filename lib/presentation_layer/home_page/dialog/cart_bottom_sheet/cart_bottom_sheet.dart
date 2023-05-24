import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart_bloc/cart_bloc.dart';
import 'widget/cart_bottom_sheet.widget.dart';

//TODO 왜 안에 빌더한번 더 넣었는지 알려줄수 있도록 공부해야함
Future<bool?> cartBottomSheet(BuildContext context) {
  final cartBloc = context.read<CartBloc>();

  return showModalBottomSheet<bool>(
      showDragHandle: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      context: context,
      builder: (_) {
        return SafeArea(
          child: BlocConsumer<CartBloc, CartState>(
            bloc: cartBloc,
            listenWhen: (previous, current) => current.status.isSuccess,
            listener: (ctx, state) {
              if (context.canPop()) {
                Navigator.pop(context, true);
              }
            },
            builder: (ctx, state) {
              return SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartProductInfo(cartBloc: cartBloc),
                    const Divider(thickness: 1, color: Colors.grey),
                    CartPriceInfo(cartBloc: cartBloc),
                    const CartBenefit(),
                    const SizedBox(height: 12),
                    AddCartBtn(cartBloc: cartBloc),
                  ],
                ),
              );
            },
          ),
        );
      });
}
