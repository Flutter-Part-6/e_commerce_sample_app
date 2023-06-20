import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/common/utils/extensions.dart';

import '../../../../domain_layer/model/display/cart/cart.model.dart';
import '../../../common/component/app_bar/widget/icon_box.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({required this.cart, Key? key}) : super(key: key);
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final selectedList = context.watch<CartListBloc>().state.selectedProduct;
    final bool isSelected = selectedList.contains(cart.product.productId);
    var textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        (isSelected)
                            ? Icons.check_circle
                            : Icons.check_circle_outline_rounded,
                        size: 20,
                        color: (isSelected)
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      onTap: () => context
                          .read<CartListBloc>()
                          .add(CartListSelected(cart: cart)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        cart.product.title,
                        style: textStyle.titleSmall?.titleCopyWith(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                child: const Icon(Icons.close, size: 20),
                onTap: () => context
                    .read<CartListBloc>()
                    .add(CartListDeleted(productIds: [cart.product.productId])),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        cart.product.imageUrl,
                        width: 50,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cart.product.price.toWon(),
                            style: textStyle.titleSmall?.priceCopyWith(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: const Border.fromBorderSide(
                                BorderSide(color: Colors.grey),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                            ),
                            width: 100,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconBox(
                                  icon: Icons.remove,
                                  onPressed: () => context
                                      .read<CartListBloc>()
                                      .add(CartListQtyDecreased(cart: cart)),
                                  color: Colors.black,
                                ),
                                Text(cart.quantity.toString()),
                                IconBox(
                                  icon: Icons.add,
                                  onPressed: () => context
                                      .read<CartListBloc>()
                                      .add(CartListQtyIncreased(cart: cart)),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
