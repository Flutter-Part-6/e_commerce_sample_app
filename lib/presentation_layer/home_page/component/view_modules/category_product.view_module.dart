import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_padding.dart';
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
  }
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
        Padding(
          padding: Constants.horizontalPadding.add(Constants.verticalPadding),
          child: const ViewModuleTitle(title: '8주년 FLEX 특가'),
        ),
        TabBar(
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          isScrollable: true,
          controller: _tabController,
          tabs: List.generate(
            _tempData.length,
            (index) {
              return Tab(
                text: _tempData[index]['title'] ?? '',
                // child: Text(
                //   _tempData[index]['title'] ?? '',
                //   style: Theme.of(context).textTheme.labelLarge?.copyWith(
                //         color: Theme.of(context).primaryColor,
                //       ),
                // ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: Constants.horizontalPadding,
          child: AspectRatio(
            aspectRatio: 7 / 6,
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                _tempData.length,
                (index) {
                  return GridView.builder(
                    itemCount: 6,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 7 / 9,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Color(Random().nextInt(0xffffffff)),
                        child: Text(index.toString()),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: Constants.horizontalPadding,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${_tempData[_tabController.index]['title']} 전체보기',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
