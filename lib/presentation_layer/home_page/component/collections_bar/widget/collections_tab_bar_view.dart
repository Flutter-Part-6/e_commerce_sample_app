import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import '../../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';
import '../../../dialog/cart_bottom_sheet/cart_bottom_sheet.dart';
import '../../../dialog/cart_response_bottom_sheet/cart_response_bottom_sheet.dart';
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
      listenWhen: (pre, cur) => pre.status != cur.status,
      listener: (context, state) async {
        final status = state.status;
        if (status.isOpen) {
          await cartBottomSheet(context).then(
            (isAdded) async =>
                context.read<CartBloc>().add(CartResponse(isAdded)),
          );
        } else if (status.isSuccess) {
          await Future.delayed(
            const Duration(milliseconds: 200),
            () async => cartResponseBottomSheet(context).whenComplete(
                () => context.read<CartBloc>().add(CartResponse(false))),
          );
        }
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
