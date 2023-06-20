import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/constants.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/product_card.component.dart';

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBlocState = context.watch<CartBloc>().state;

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
                  : Text(
                      '${cartBlocState.totalPrice.toWon()} 장바구니 담기',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.priceCopyWith()
                          .copyWith(
                            color: Colors.white,
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
