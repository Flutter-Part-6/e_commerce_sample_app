import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/common/constant.dart';

import '../../bloc/cart_bloc/cart_bloc.dart';
import 'widget/cart_bottom_sheet.widget.dart';

//TODO 왜 안에 빌더한번 더 넣었는지 알려줄수 있도록 공부해야함
Future<bool?> cartBottomSheet(BuildContext context) {
  final cartBloc = context.read<CartBloc>();

  return showModalBottomSheet<bool>(
    context: context,
    builder: (_) {
      return SafeArea(
        child: BlocListener<CartListBloc, CartListState>(
          listener: (listCxt, state) {
            if (state.status.isError) {
              ScaffoldMessenger.of(listCxt).showSnackBar(
                SnackBar(
                  content: Text(state.errorMsg),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
              if (context.canPop()) {
                Navigator.pop(context, false);
              }
            } else {
              if (context.canPop()) {
                Navigator.pop(context, true);
              }
            }
          },
          listenWhen: (prev, cur) =>
              (prev.status != cur.status) && !cur.status.isLoading,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (ctx, state) {
              return SingleChildScrollView(
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
            bloc: cartBloc,
          ),
        ),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(12.0),
      ),
    ),
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
  );
}
