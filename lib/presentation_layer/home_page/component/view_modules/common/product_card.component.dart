import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/product_card_widget.dart';

class SmallProductCard extends ProductCardWidget {
  final BuildContext context;

  SmallProductCard({
    super.key,
    required this.context,
    required super.productInfo,
    // required super.imageAspect,
  }) : super(
          imageAspect: 114 / 152,
          needShowReviewCount: false,
          titleStyle: Theme.of(context).textTheme.labelMedium,
          priceStyle: Theme.of(context).textTheme.labelMedium,
          additionalStyle: Theme.of(context).textTheme.labelSmall,
        );
}

class LargeProductCard extends ProductCardWidget {
  final BuildContext context;

  LargeProductCard({
    super.key,
    required this.context,
    required super.productInfo,
    // required super.imageAspect,
  }) : super(
          imageAspect: 156 / 203,
          needShowReviewCount: true,
          titleStyle: Theme.of(context).textTheme.titleSmall,
          priceStyle: Theme.of(context).textTheme.titleSmall,
          additionalStyle: Theme.of(context).textTheme.labelMedium,
        );
}

extension TextStyleEx on TextStyle {
  TextStyle titleCopyWith() {
    return copyWith(
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle discountRageCopyWith() {
    return copyWith(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle priceCopyWith() {
    return copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle originalPriceCopyWith() {
    return copyWith(
      fontWeight: FontWeight.w300,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle reviewCountCopyWith() {
    return copyWith(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    );
  }
}
