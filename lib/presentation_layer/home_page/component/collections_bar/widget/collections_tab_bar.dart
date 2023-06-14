import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/home_page_bloc.dart';

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
    final currentStatus = context.watch<CollectionsBloc>().state.status;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300] ?? Colors.grey),
        ),
      ),
      height: 50,
      child: Stack(
        children: [
          TabBar(
            isScrollable: true,
            tabs: collections.map((e) => GnbTab(e.title)).toList(),
            controller: tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: (index) {},
          ),
          if (currentStatus.isLoading)
            Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                  strokeWidth: 1.5,
                ),
              ),
            ),
        ],
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
