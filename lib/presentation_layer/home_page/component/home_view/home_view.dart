import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import '../../../../domain_layer/model/display/collection/collection.model.dart';
import 'widget/collections_tab_bar.dart';
import 'widget/collections_tab_bar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    required this.storeType,
    required this.collections,
    super.key,
  });

  final StoreType storeType;
  final List<Collection> collections;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.collections.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionsTabBar(
          tabController: _tabController,
          collections: widget.collections,
        ),
        CollectionsTabBarView(
          tabController: _tabController,
          storeType: widget.storeType,
          collections: widget.collections,
        ),
      ],
    );
  }
}
