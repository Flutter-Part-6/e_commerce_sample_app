import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../domain_layer/model/display.model.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_icons.dart';
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
      right: 8,
      bottom: 8,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.47),
            shape: BoxShape.circle,
          ),
          width: 32,
          height: 32,
          child: Center(
            child: SvgPicture.asset(
              AppIcons.cart,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
        ),
        onTap: () => context.read<CartBloc>().add(CartOpened(productInfo)),
      ),
    );
  }
}
