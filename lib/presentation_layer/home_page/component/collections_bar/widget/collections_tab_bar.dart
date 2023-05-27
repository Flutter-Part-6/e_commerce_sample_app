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
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      height: 50,
      child: TabBar(
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        onTap: (index) {},
        controller: tabController,
        tabs: collections.map((e) => GnbTab(e.title)).toList(),
      ),
    );
  }
}

class GnbTab extends StatelessWidget {
  const GnbTab(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
      // child: Text(
      //   text,
      //   style: const TextStyle(
      //     fontSize: 18,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}
