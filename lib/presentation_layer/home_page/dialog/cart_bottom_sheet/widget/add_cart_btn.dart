import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({required this.cartBloc, Key? key}) : super(key: key);
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final state = cartBloc.state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => cartBloc.add(CartAdded()),
        child: Container(
          alignment: Alignment.center,
          height: 52,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.blue),
          child: (state.status.isLoading)
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )
              : Text(
                  '${state.totalPrice} 장바구니 담기',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
