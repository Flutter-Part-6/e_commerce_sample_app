import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants.dart';
import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../../../../theme/app_icons.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import 'core/view_module_widget.dart';
import 'widget/product_card.component.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_title.dart';

var _tempData = [
  {
    "title": "가전,가구 특가",
  },
  {
    "title": "프리미엄 주방 특가",
  },
  {
    "title": "뷰티 특가",
  },
  {
    "title": "프리미엄 식품 특가",
  },
];

class CategoryProductViewModule extends StatefulWidget with ViewModuleWidget {
  const CategoryProductViewModule(this.info, {Key? key}) : super(key: key);

  final ViewModule info;

  @override
  State<CategoryProductViewModule> createState() =>
      _CategoryProductViewModuleState();
}

class _CategoryProductViewModuleState extends State<CategoryProductViewModule>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tempData.length,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewModulePadding(
          child: ViewModuleTitle(
            title: widget.info.title,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TabBar(
          tabs: List.generate(_tempData.length, (index) {
            return Tab(text: _tempData[index]['title'] ?? '');
          }),
          controller: _tabController,
          isScrollable: true,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 13),
          dividerColor: Colors.transparent,
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: Constants.horizontalPadding,
          child: AspectRatio(
            aspectRatio: 343 / 452,
            child: TabBarView(
              children: List.generate(
                _tempData.length,
                (index) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 8,
                      childAspectRatio: (343 / 3) / (452 / 2),
                    ),
                    itemBuilder: (context, index) {
                      final productInfo = widget.info.products[index];

                      return SmallProductCard(
                        context: context,
                        productInfo: productInfo,
                      );
                    },
                    itemCount: widget.info.products.length,
                  );
                },
              ),
              controller: _tabController,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          margin: Constants.horizontalPadding,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_tempData[_tabController.index]['title']} 전체보기',
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
          height: 50,
        ),
      ],
    );
  }
}
