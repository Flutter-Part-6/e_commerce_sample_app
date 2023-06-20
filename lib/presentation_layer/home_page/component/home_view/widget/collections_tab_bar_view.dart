import 'package:flutter/material.dart';

import '../../../../../common/constants.dart';
import '../../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../view_modules/view_module_list.dart';

class CollectionsTabBarView extends StatelessWidget {
  const CollectionsTabBarView({
    required this.tabController,
    required this.storeType,
    required this.collections,
    Key? key,
  }) : super(key: key);
  final TabController tabController;
  final StoreType storeType;
  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: collections
            .map((e) => ViewModuleList(tabId: e.tabId, storeType: storeType))
            .toList(),
        controller: tabController,
      ),
    );
  }
}
