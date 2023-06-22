import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain_layer/model/display.model.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icons.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../../../common/utils/extensions.dart';
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
          ViewModuleTitle(
            title: info.title,
          ),
          SizedBox(
            height: 8,
          ),
          if (info.imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 13),
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
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                info.subtitle,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(
                      color: Theme.of(context).colorScheme.contentSecondary,
                    )
                    .regular,
              ),
            ),
          const Divider(
            thickness: 1,
            color: AppColors.outline,
          ),
          const SizedBox(
            height: 16,
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
                height: 8,
              );
            },
            itemCount: info.products.length,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' 전체보기',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                          color: Theme.of(context).colorScheme.contentPrimary,
                        )
                        .regular,
                  ),
                  SvgPicture.asset(
                    AppIcons.chevronRight,
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.contentPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
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

    return AspectRatio(
      aspectRatio: 343 / 61,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 49,
            height: 49,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(productInfo.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productInfo.title,
                    style: textStyle.labelLarge?.titleCopyWith(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${productInfo.discountRate}%',
                        style: textStyle.labelLarge?.discountRageCopyWith(),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        productInfo.price.toWon(),
                        style: textStyle.labelLarge?.priceCopyWith(),
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
          ),
          const SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: TextButton(
              onPressed: () {
                context.read<CartBloc>().add(CartOpened(productInfo));
              },
              style: ButtonStyle(
                padding: MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 8, horizontal: 10)
                      .copyWith(left: 8),
                ),
                minimumSize: MaterialStatePropertyAll<Size>(Size.zero),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[400] ?? Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
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
