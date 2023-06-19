import 'package:flutter/material.dart';

import '../../../../../domain_layer/model/display/collection/collection.model.dart';

class CollectionsTabBar extends StatelessWidget {
  const CollectionsTabBar({
    required this.tabController,
    required this.collections,
    Key? key,
  }) : super(key: key);
  final TabController tabController;
  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300] ?? Colors.grey),
        ),
      ),
      height: 50,
      child: TabBar(
        tabs: collections
            .map(
              (e) => Tab(
                text: e.title,
              ),
            )
            .toList(),
        controller: tabController,
        isScrollable: true,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
