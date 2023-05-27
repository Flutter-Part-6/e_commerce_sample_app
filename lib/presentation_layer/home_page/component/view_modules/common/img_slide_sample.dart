import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/product_card.component.dart';

import '../../../../../common/constants.dart';
import '../../../../../domain_layer/model/display/product_info/product_info.model.dart';

class ImgSlide extends StatelessWidget {
  const ImgSlide(this.products, {Key? key}) : super(key: key);
  final List<ProductInfo> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: Constants.horizontalPadding,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final productInfo = products[index];
          return ProductCardComponent(productInfo: productInfo);
        },
      ),
    );
  }
}
