import 'package:flutter/material.dart';

import 'product_card_widget.dart';

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
