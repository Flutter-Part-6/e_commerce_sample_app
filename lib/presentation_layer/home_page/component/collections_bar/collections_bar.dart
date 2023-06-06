import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/collections_bar/widget/collections_tab_bar.dart';
import 'package:sample_app/presentation_layer/home_page/component/collections_bar/widget/collections_tab_bar_view.dart';

import '../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../bloc/home_page_bloc.dart';
import '../footer/footer.dart';

class CollectionsBar extends StatefulWidget {
  const CollectionsBar({
    required this.storeType,
    required this.collections,
    super.key,
  });

  final StoreType storeType;
  final List<Collection> collections;

  @override
  State<CollectionsBar> createState() => _CollectionsBarState();
}

class _CollectionsBarState extends State<CollectionsBar>
    with TickerProviderStateMixin {
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

class LoadingCollectionsBar extends StatelessWidget {
  const LoadingCollectionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
