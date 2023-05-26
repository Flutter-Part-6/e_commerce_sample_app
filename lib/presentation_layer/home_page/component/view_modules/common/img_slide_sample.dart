import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

import '../../../../../domain_layer/model/display/product_info/product_info.model.dart';

class ImgSlide extends StatelessWidget {
  const ImgSlide(this.products, {Key? key}) : super(key: key);
  final List<ProductInfo> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final productInfo = products[index];
          final f = NumberFormat('###,###,###,###원');
          final price = f.format(productInfo.price);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    productInfo.imageUrl,
                    height: 160,
                    width: 125,
                  ),
                  Container(
                      color: Colors.black.withOpacity(0.2),
                      height: 160,
                      width: 125),
                  Positioned(
                    right: 5,
                    bottom: 12,
                    child: GestureDetector(
                      onTap: () => context.read<CartBloc>().add(
                            CartOpened(productInfo),
                          ),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        height: 35,
                        width: 35,
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(productInfo.title),
              Text(price),
            ],
          );
        },
      ),
    );
  }
}
