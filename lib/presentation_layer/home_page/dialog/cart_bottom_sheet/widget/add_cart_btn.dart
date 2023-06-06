import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({required this.cartBloc, Key? key}) : super(key: key);

  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final quantity = cartBloc.state.quantity;
    final productInfo = cartBloc.state.productInfo;
    final totalPrice = cartBloc.state.totalPrice;

    return BlocBuilder<CartListBloc, CartListState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 52,
              child: (state.status == CartListStatus.loading)
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )
                  : Text(
                      '${totalPrice.toWon()} 장바구니 담기',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            onTap: () => context.read<CartListBloc>().add(
                  CartListAdded(quantity: quantity, productInfo: productInfo),
                ),
          ),
        );
      },
    );
  }
}
