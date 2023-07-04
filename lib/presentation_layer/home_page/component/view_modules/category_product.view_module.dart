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
      length: widget.info.tabs.length,
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
    final colorScheme = Theme.of(context).colorScheme;

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
          tabs: List.generate(widget.info.tabs.length, (index) {
            return Tab(text: widget.info.tabs[index] ?? '');
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
                widget.info.tabs.length,
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
            color: colorScheme.surface,
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
                // Text(
                //   '${widget.info.tabs[_tabController.index]} 전체보기',
                //   style: Theme.of(context)
                //       .textTheme
                //       .titleSmall
                //       ?.copyWith(
                //         color: colorScheme.contentPrimary,
                //       )
                //       .regular,
                // ),
                SvgPicture.asset(
                  AppIcons.chevronRight,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    colorScheme.contentPrimary,
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
