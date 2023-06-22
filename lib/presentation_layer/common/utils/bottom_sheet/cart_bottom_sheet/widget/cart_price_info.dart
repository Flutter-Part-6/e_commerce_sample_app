import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../theme/app_icons.dart';
import '../../../../../home_page/bloc/cart_bloc/cart_bloc.dart';
import '../../../../../../common/utils/extensions.dart';
import '../../../../component/app_bar/widget/icon_box.dart';

class CartPriceInfo extends StatelessWidget {
  const CartPriceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final state = context.watch<CartBloc>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.productInfo.title,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    state.productInfo.price.toWon(),
                    style:
                        Theme.of(context).textTheme.titleSmall?.priceCopyWith(),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(color: Colors.grey),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                width: 100,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBox(
                      icon: AppIcons.subtract,
                      onPressed: () => cartBloc.add(CartQuantityDecreased()),
                      color: Colors.black,
                    ),
                    Text('${state.quantity}'),
                    IconBox(
                      icon: AppIcons.add,
                      onPressed: () => cartBloc.add(CartQuantityIncreased()),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
