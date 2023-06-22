import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import '../../bloc/collections_bloc/collections_bloc.dart';
import '../view_modules/view_module_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void didChangeDependencies() {
    final collections = context.watch<CollectionsBloc>().state.collections;
    _tabController = TabController(length: collections.length, vsync: this);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storeType = context.watch<CollectionsBloc>().state.storeType;
    final collections = context.watch<CollectionsBloc>().state.collections;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            tabs: collections.map((e) => Tab(text: e.title)).toList(),
            controller: _tabController,
            // isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: colorScheme.primary,
            labelStyle: textTheme.titleSmall.semiBold,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            unselectedLabelColor: colorScheme.contentSecondary,
            unselectedLabelStyle: textTheme.titleSmall,
            onTap: (index) {},
          ),
        ),
        Expanded(
          child: TabBarView(
            children: collections
                .map(
                  (e) => ViewModuleList(tabId: e.tabId, storeType: storeType),
                )
                .toList(),
            controller: _tabController,
          ),
        ),
      ],
    );
  }
}
