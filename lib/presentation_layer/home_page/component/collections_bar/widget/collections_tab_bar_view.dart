import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/routes.dart';

import '../../../../../common/constants.dart';
import '../../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';
import '../../../dialog/cart_bottom_sheet/cart_bottom_sheet.dart';
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
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) async {
        final bool isSuccess = await cartBottomSheet(context).whenComplete(
                () => context.read<CartBloc>().add(CartClosed())) ??
            false;

        if (!isSuccess) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.add_shopping_cart, color: Colors.white),
                const SizedBox(width: 8),
                Text('상품을 장바구니에 담았습니다.',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              textColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => context.push(Routes.cartPath),
              label: '장바구니 보기',
            ),
            duration: Duration(seconds: 2),
          ),
        );
      },
      listenWhen: (pre, cur) => pre.status.isClose && cur.status.isOpen,
      child: Expanded(
        child: TabBarView(
          children: collections
              .map((e) => ViewModuleList(tabId: e.tabId, storeType: storeType))
              .toList(),
          controller: tabController,
        ),
      ),
    );
  }
}
