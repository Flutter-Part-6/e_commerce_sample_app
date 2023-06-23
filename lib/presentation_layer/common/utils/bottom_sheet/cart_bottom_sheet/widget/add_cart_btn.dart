import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/constants.dart';
import '../../../../../../theme/typography.dart';
import '../../../../../cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../../../../home_page/bloc/cart_bloc/cart_bloc.dart';
import '../../../../../../common/utils/extensions.dart';

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBlocState = context.watch<CartBloc>().state;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CartListBloc, CartListState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 52,
              child: (state.status.isLoading)
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )
                  : RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${cartBlocState.totalPrice.toWon()}',
                            style: textTheme.titleSmall.semiBold?.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          TextSpan(
                            text: ' 장바구니 담기',
                            style: textTheme.titleSmall?.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            onTap: () => context.read<CartListBloc>().add(
                  CartListAdded(
                    quantity: cartBlocState.quantity,
                    productInfo: cartBlocState.productInfo,
                  ),
                ),
          ),
        );
      },
    );
  }
}
