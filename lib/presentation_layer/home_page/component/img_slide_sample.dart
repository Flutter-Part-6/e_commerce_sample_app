import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain_layer/model/display/product_info/product_info.model.dart';

class ImgSlide extends StatelessWidget {
  const ImgSlide(this.products, {Key? key}) : super(key: key);
  final List<ProductInfo> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, index) => const SizedBox(width: 16),
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
                        onTap: () {
                          final title = products[index].title;
                          showModalBottomSheet(
                            showDragHandle: true,
                            useSafeArea: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            productInfo.imageUrl,
                                            height: 40,
                                            width: 40,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(productInfo.title),
                                              const SizedBox(height: 4),
                                              Text(
                                                productInfo.subtitle,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(height: 1, color: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(productInfo.title),
                                          const SizedBox(height: 10),
                                          Text(
                                            price,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 12),
                                          Container(
                                              height: 1, color: Colors.grey),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: const Text(
                                          '로그인 후, 할인 및 적립 혜택 적용',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 52,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.blue),
                                        child: Text(
                                          '$price 장바구니 담기',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                          print('[test] title : $title');
                        },
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
                      ))
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
