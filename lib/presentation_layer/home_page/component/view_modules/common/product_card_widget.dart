import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/product_card.component.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final double imageAspect;
  final bool needShowReviewCount;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final TextStyle? additionalStyle;

  const ProductCardWidget({
    Key? key,
    required this.productInfo,
    required this.imageAspect,
    required this.needShowReviewCount,
    required this.titleStyle,
    required this.priceStyle,
    required this.additionalStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: imageAspect,
              child: Image.network(
                productInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 5,
              bottom: 12,
              child: GestureDetector(
                onTap: () => context.read<CartBloc>().add(
                      CartOpened(productInfo),
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                  ),
                  height: 35,
                  width: 35,
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          productInfo.title,
          style: titleStyle?.titleCopyWith(),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Text(
              '${productInfo.discountRate.toString()}%',
              style: priceStyle?.discountRageCopyWith(),
            ),
            Text(
              productInfo.price.toWon(),
              style: priceStyle?.priceCopyWith(),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          productInfo.originalPrice.toWon(),
          style: additionalStyle?.originalPriceCopyWith(),
        ),
        if (needShowReviewCount)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: [
                const Icon(
                  Icons.comment_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '후기 ${productInfo.reviewCount.toReview()}',
                  style: additionalStyle?.reviewCountCopyWith(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
