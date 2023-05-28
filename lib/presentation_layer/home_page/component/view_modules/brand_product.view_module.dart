import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_padding.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_title.dart';

import '../../../../common/constants.dart';
import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import 'core/view_module_widget.dart';

class BrandProductViewModule extends StatelessWidget with ViewModuleWidget {
  const BrandProductViewModule(this.info, {Key? key}) : super(key: key);

  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return ViewModulePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ViewModuleTitle(
            title: info.title,
          ),
          if (info.imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AspectRatio(
                aspectRatio: 360 / 180,
                child: Image.network(
                  info.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (info.subtitle.isNotEmpty)
            Padding(
              padding: Constants.verticalPadding,
              child: Text(info.subtitle),
            ),
          const Divider(
            thickness: 1,
          ),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return BrandProductItem(
                  productInfo: info.products[index],
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: info.products.length),
        ],
      ),
    );
  }
}

class BrandProductItem extends StatelessWidget {
  final ProductInfo productInfo;

  const BrandProductItem({Key? key, required this.productInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              productInfo.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(productInfo.title),
              Row(
                children: [
                  Text('${productInfo.discountRate}%'),
                  Text(productInfo.price.toWon()),
                  Text(productInfo.originalPrice.toWon()),
                ],
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
            ),
            onPressed: () {
              context.read<CartBloc>().add(
                    CartOpened(productInfo),
                  );
            },
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '담기',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
