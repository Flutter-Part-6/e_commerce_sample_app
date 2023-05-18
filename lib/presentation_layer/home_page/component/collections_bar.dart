import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_module_list.dart';

import '../../../domain_layer/model/display/collection/collection.model.dart';
import '../bloc/home_page_bloc.dart';

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
        SizedBox(
          height: 60,
          child: TabBar(
              onTap: (index) {},
              controller: _tabController,
              tabs: widget.collections.map((e) => GnbTab(e.title)).toList()),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.collections.map(
              (e) {
                return ViewModuleList(
                  storeType: widget.storeType,
                  tabId: e.tabId,
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }
}

class GnbTab extends StatelessWidget {
  const GnbTab(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
