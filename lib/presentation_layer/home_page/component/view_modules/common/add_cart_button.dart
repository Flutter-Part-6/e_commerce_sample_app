import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../../bloc/cart_bloc/cart_bloc.dart';

class AddCartButton extends StatelessWidget {
  final ProductInfo productInfo;

  const AddCartButton({
    Key? key,
    required this.productInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      bottom: 12,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          width: 35,
          height: 35,
          child: const Icon(
            Icons.shopping_cart_outlined,
            size: 18,
            color: Colors.white,
          ),
        ),
        onTap: () => context.read<CartBloc>().add(CartOpened(productInfo)),
      ),
    );
  }
}
