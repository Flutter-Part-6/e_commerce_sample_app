import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_title.dart';

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

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key? key}) : super(key: key);

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct>
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
        const ViewModuleTitle(title: '8주년 FLEX 특가'),
        TabBar(
          isScrollable: true,
          indicatorColor: Theme.of(context).highlightColor,
          controller: _tabController,
          tabs: List.generate(
            _tempData.length,
            (index) {
              return Tab(
                child: Text(
                  _tempData[index]['title'] ?? '',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              );
            },
          ),
        ),
        AspectRatio(
          aspectRatio: 5 / 4,
          child: TabBarView(
            controller: _tabController,
            children: List.generate(
              _tempData.length,
              (index) {
                // return GridView.custom(
                //   physics: const NeverScrollableScrollPhysics(),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 3,
                //     childAspectRatio: 2 / 3,
                //   ),
                //   childrenDelegate: SliverChildBuilderDelegate(
                //     childCount: 6,
                //     (context, index) {
                //       return Container(
                //         color: Color(Random().nextInt(0xffffffff)),
                //         child: Text(index.toString()),
                //       );
                //     },
                //   ),
                // );

                return GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
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
        Container(
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
      ],
    );
  }
}
