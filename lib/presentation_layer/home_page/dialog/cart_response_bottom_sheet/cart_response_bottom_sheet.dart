import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

import 'widget/cart_response_bottom_sheet.widget.dart';

Future cartResponseBottomSheet(BuildContext context) async {
  final cartBloc = context.read<CartBloc>();

  return await showModalBottomSheet(
    showDragHandle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    context: context,
    builder: (context) {
      return BlocBuilder<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (ctx, state) {
          return SafeArea(
            child: Container(
              alignment: Alignment.topLeft,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartResponseInfo(cartBloc: cartBloc),
                    const Divider(thickness: 1, color: Colors.grey),
                    const CartResponseProductsTitle(),
                    const CartResponseProducts(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}