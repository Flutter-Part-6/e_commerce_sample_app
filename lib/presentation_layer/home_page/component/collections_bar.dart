import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_module_list.dart';

import '../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../injection.dart';
import '../bloc/collections_bloc/collections_bloc.dart';

class CollectionsBar extends StatelessWidget {
  const CollectionsBar({
    required this.storeType,
    required this.collections,
    Key? key,
  }) : super(key: key);
  final StoreType storeType;
  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => serviceLocator<ViewModulesBloc>()
          ..add(ViewModulesInitialized(
              storeType: storeType, collections: collections)),
        child: CollectionsBarView(
          storeType: storeType,
          collections: collections,
        ));
  }
}

class CollectionsBarView extends StatefulWidget {
  const CollectionsBarView({
    required this.storeType,
    required this.collections,
    super.key,
  });

  final StoreType storeType;
  final List<Collection> collections;

  @override
  State<CollectionsBarView> createState() => _CollectionsBarViewState();
}

class _CollectionsBarViewState extends State<CollectionsBarView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.collections.length, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final tabIndex = _tabController.index;
        context
            .read<ViewModulesBloc>()
            .add(ViewModulesFetched(tabIndex: tabIndex));
      }
    });
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
            children: widget.collections
                .asMap()
                .entries
                .map((e) => ViewModuleList(tabIndex: e.key))
                .toList(),
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
