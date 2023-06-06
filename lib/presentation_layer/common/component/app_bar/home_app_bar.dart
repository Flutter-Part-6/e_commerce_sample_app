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
      leading: const Center(child: Text('TEST')),
      title: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        height: 34,
        child: TabBar(
          tabs: [
            Tab(text: StoreType.values.first.index.toString()),
            Tab(text: StoreType.values[1].index.toString()),
          ],
          controller: _tabController,
          isScrollable: true,
          padding: const EdgeInsets.all(0),
          indicatorWeight: 1,
          indicator: BoxDecoration(
            color: Colors.green,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          labelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          onTap: (tabIndex) {},
        ),
      ),
      actions: [
        const IconBox(icon: Icons.location_on_outlined, onPressed: null),
        Stack(alignment: Alignment.center, children: [
          IconBox(
            icon: Icons.shopping_cart_outlined,
            onPressed: () => context.push('/cart-list'),
          ),
          Positioned(
            top: 10,
            right: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: 16,
              height: 16,
              child: Center(
                child: Text(
                  '$cartCount',
                  style: const TextStyle(color: Colors.black, fontSize: 9),
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(width: 8),
      ],
      elevation: 0,
      centerTitle: true,
    );
  }
}
