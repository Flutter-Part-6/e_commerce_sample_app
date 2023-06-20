import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/common/utils/extensions.dart';

import '../../../../common/constants.dart';
import 'core/view_module_widget.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_title.dart';

class BrandProductViewModule extends StatelessWidget with ViewModuleWidget {
  const BrandProductViewModule(this.info, {Key? key}) : super(key: key);

  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return ViewModulePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Constants.verticalPadding,
            child: ViewModuleTitle(
              title: info.title,
            ),
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
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                info.subtitle,
                style: Theme.of(context).textTheme.titleMedium?.titleCopyWith(),
              ),
            ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return BrandProductItem(
                productInfo: info.products[index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: info.products.length,
          ),
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
    var textStyle = Theme.of(context).textTheme;

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                productInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productInfo.title,
                  style: textStyle.titleSmall?.titleCopyWith(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Text(
                      '${productInfo.discountRate}%',
                      style: textStyle.titleSmall?.discountRageCopyWith(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      productInfo.price.toWon(),
                      style: textStyle.titleSmall?.priceCopyWith(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      productInfo.originalPrice.toWon(),
                      style: textStyle.labelMedium?.originalPriceCopyWith(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          TextButton(
            onPressed: () {
              context.read<CartBloc>().add(CartOpened(productInfo));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey[400] ?? Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Row(children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 18,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                Text('담기', style: TextStyle(color: Colors.black)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
