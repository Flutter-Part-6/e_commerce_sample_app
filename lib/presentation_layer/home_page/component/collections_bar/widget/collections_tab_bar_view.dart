import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import '../../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';
import '../../../dialog/cart_bottom_sheet.dart';
import '../../view_modules/view_module_list.dart';

class CollectionsTabBarView extends StatelessWidget {
  const CollectionsTabBarView(
      {required this.tabController,
      required this.storeType,
      required this.collections,
      Key? key})
      : super(key: key);
  final TabController tabController;
  final StoreType storeType;
  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          (previous.status.isClose && current.status.isOpen),
      listener: (context, state) async {
        final bool canAdd = (await cartBottomSheet(context)) ?? false;
        await Future.delayed(
          Duration.zero,
          () => context.read<CartBloc>().add(CartAdded(canAdd)),
        );
      },
      child: Expanded(
        child: TabBarView(
          controller: tabController,
          children: collections
              .map((e) => ViewModuleList(storeType: storeType, tabId: e.tabId))
              .toList(),
        ),
      ),
    );
  }
}
