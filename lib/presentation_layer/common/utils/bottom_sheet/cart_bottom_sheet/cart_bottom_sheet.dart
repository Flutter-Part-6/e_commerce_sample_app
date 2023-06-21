import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/constants.dart';
import '../../../../cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../snack_bar/common_snack_bar.dart';
import 'widget/cart_bottom_sheet.widget.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  return showModalBottomSheet<bool>(
    context: context,
    builder: (_) {
      return SafeArea(
        child: BlocListener<CartListBloc, CartListState>(
          listener: (_, state) {
            if (state.status.isError) {
              CommonSnackBar.errorSnackBar(context, msg: state.errorMsg);
            }
            if (context.canPop()) {
              Navigator.pop(context, !state.status.isError);
            }
          },
          listenWhen: (prev, cur) =>
              (prev.status != cur.status) && !cur.status.isLoading,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartProductInfo(),
                const Divider(thickness: 1),
                const CartPriceInfo(),
                const CartBenefit(),
                const SizedBox(height: 12),
                const AddCartBtn(),
              ],
            ),
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
