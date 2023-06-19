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
              () => context.read<CartBloc>().add(CartClosed()),
            ) ??
            false;

        if (!isSuccess) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.add_shopping_cart, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  '상품을 장바구니에 담았습니다.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            padding: EdgeInsets.only(left: 16, top: 10, right: 14, bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              textColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              label: '장바구니 보기',
              onPressed: () => context.push(Routes.cartPath),
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
