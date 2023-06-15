import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/product_card.component.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_title.dart';

import '../../../../common/constants.dart';
import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import 'core/view_module_widget.dart';

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
    return Padding(
      padding: Constants.verticalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Constants.horizontalPadding.add(Constants.verticalPadding),
            child: ViewModuleTitle(
              title: widget.info.title,
            ),
          ),
          TabBar(
            tabs: List.generate(_tempData.length, (index) {
              return Tab(text: _tempData[index]['title'] ?? '');
            }),
            controller: _tabController,
            isScrollable: true,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: Constants.horizontalPadding,
            child: AspectRatio(
              aspectRatio: 368 / 477,
              child: TabBarView(
                children: List.generate(
                  _tempData.length,
                  (index) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 8,
                        childAspectRatio: (348 / 3) / (459 / 2),
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
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: 50,
            margin: Constants.horizontalPadding,
            child: Center(
              child: Text('${_tempData[_tabController.index]['title']} 전체보기'),
            ),
          ),
        ],
      ),
    );
  }
}
