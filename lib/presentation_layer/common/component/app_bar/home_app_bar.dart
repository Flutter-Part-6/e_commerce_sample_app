import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/common/component/app_bar/widget/icon_box.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    )..addListener(_onChanged);
  }

  void _onChanged() {
    final tabIndex = _tabController.index;
    if (!_tabController.indexIsChanging) {
      context.read<CollectionsBloc>().add(ToggledStoreTypes(tabIndex));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartListBloc>().state.cartList.length;
    return AppBar(
      elevation: 0,
      actions: [
        const IconBox(
          icon: Icons.location_on_outlined,
          onPressed: null,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconBox(
              icon: Icons.shopping_cart_outlined,
              onPressed: () => context.push('/cart-list'),
            ),
            Positioned(
              right: 4,
              top: 10,
              child: Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 8),
      ],
      // backgroundColor: Colors.purple,
      leading: const Center(child: Text('TEST')),
      centerTitle: true,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 34,
        child: TabBar(
          padding: const EdgeInsets.all(0),
          onTap: (tabIndex) {},
          indicatorWeight: 1,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green,
          ),
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: StoreType.values[0].index.toString(),
            ),
            Tab(
              text: StoreType.values[1].index.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
