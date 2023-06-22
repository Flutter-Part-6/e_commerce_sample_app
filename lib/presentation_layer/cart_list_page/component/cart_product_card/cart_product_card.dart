import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icons.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import '../../bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../../../common/utils/extensions.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .add(EdgeInsets.only(top: 20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 체크 박스
          GestureDetector(
            child: SvgPicture.asset(
              (isSelected)
                  ? AppIcons.checkMarkCircleFill
                  : AppIcons.checkMarkCircle,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(
                (isSelected)
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.contentFourth,
                BlendMode.srcIn,
              ),
            ),
            onTap: () =>
                context.read<CartListBloc>().add(CartListSelected(cart: cart)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    // 상품 정보
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 상품 명
                          SizedBox(
                            height: 28,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                cart.product.title,
                                style: textStyle.titleSmall
                                    ?.titleCopyWith()
                                    .regular,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 11),
                          // 상품 정보
                          SizedBox(
                            height: 75,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // 상품 이미지
                                Image.network(
                                  cart.product.imageUrl,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 20),

                                // 상품 정보
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 가격
                                    Text(
                                      cart.product.price.toWon(),
                                      style: textStyle.titleMedium
                                          ?.priceCopyWith(),
                                    ),

                                    Spacer(),
                                    // 수량 설정
                                    Container(
                                      decoration: BoxDecoration(
                                        border: const Border.fromBorderSide(
                                          BorderSide(
                                            color: AppColors.outline,
                                          ),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                      ),
                                      width: 96,
                                      height: 36,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconBox(
                                            icon: AppIcons.subtract,
                                            iconSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .contentFourth,
                                            onPressed: () => context
                                                .read<CartListBloc>()
                                                .add(CartListQtyDecreased(
                                                    cart: cart)),
                                          ),
                                          Text(
                                            cart.quantity.toString(),
                                            style: textStyle.labelLarge
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .contentPrimary,
                                                )
                                                .semiBold,
                                          ),
                                          IconBox(
                                            icon: AppIcons.add,
                                            iconSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .contentPrimary,
                                            onPressed: () => context
                                                .read<CartListBloc>()
                                                .add(CartListQtyIncreased(
                                                    cart: cart)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppIcons.close,
                          width: 28,
                          height: 28,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.contentTertiary,
                            BlendMode.srcIn,
                          ),
                        ),
                        onTap: () => context.read<CartListBloc>().add(
                              CartListDeleted(
                                productIds: [cart.product.productId],
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                  ),
                  child: Divider(
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        (isSelected)
                            ? AppIcons.checkMarkCircleFill
                            : AppIcons.checkMarkCircle,
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                          (isSelected)
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.contentFourth,
                          BlendMode.srcIn,
                        ),
                      ),
                      onTap: () => context
                          .read<CartListBloc>()
                          .add(CartListSelected(cart: cart)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        cart.product.title,
                        style: textStyle.titleSmall?.titleCopyWith().regular,
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
                                  icon: AppIcons.subtract,
                                  color: Colors.black,
                                  onPressed: () => context
                                      .read<CartListBloc>()
                                      .add(CartListQtyDecreased(cart: cart)),
                                ),
                                Text(cart.quantity.toString()),
                                IconBox(
                                  icon: AppIcons.add,
                                  color: Colors.black,
                                  onPressed: () => context
                                      .read<CartListBloc>()
                                      .add(CartListQtyIncreased(cart: cart)),
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
