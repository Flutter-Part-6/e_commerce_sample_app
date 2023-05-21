import 'package:flutter/material.dart';

import '../../../domain_layer/model/display/product_info/product_info.model.dart';

class ImgSlide extends StatelessWidget {
  const ImgSlide(this.products, {Key? key}) : super(key: key);
  final List<ProductInfo> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) => Image.network(
          products[index].imageUrl,
          height: 160,
          width: 125,
        ),
      ),
    );
  }
}
