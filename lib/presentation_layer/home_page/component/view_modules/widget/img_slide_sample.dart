import 'package:flutter/material.dart';

import '../../../../../common/constants.dart';
import '../../../../../domain_layer/model/display/product_info/product_info.model.dart'
    show ProductInfo;
import 'product_card.component.dart';

class ImgSlide extends StatelessWidget {
  const ImgSlide(this.products, {Key? key}) : super(key: key);
  final List<ProductInfo> products;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 307,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: Constants.horizontalPadding,
        itemBuilder: (context, index) {
          final productInfo = products[index];

          return AspectRatio(
            aspectRatio: 156 / 307,
            child: LargeProductCard(context: context, productInfo: productInfo),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemCount: products.length,
      ),
    );
  }
}
