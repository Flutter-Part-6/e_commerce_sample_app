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
    final storeType = context.watch<CollectionsBloc>().state.storeType;
    final primaryColor = Theme.of(context).primaryColor;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color:storeType.isMarket ? primaryColor : Colors.white ,
      child: AppBar(
        leading: Center(
          child: Text(
            'TEST',
            style: TextStyle(
              color: storeType.isMarket ? Colors.white : primaryColor,
            ),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: (storeType.isMarket)
                ? Color.fromRGBO(111, 26, 140, 1)
                : Color.fromRGBO(242, 242, 242, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          height: 26,
          child: TabBar(
            tabs: [
              Tab(text: StoreType.market.toName),
              Tab(text: StoreType.beauty.toName),
            ],
            controller: _tabController,
            isScrollable: true,
            padding: const EdgeInsets.all(0),
            indicatorWeight: 1,
            indicatorPadding: EdgeInsets.all(0),
            indicator: BoxDecoration(
              color: storeType.isMarket ? Colors.white : primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            labelColor: (storeType.isMarket) ? primaryColor : Colors.white,
            labelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            labelPadding: EdgeInsets.symmetric(horizontal: 11),
            unselectedLabelColor: (storeType.isMarket)
                ? Colors.white
                : Color.fromRGBO(128, 128, 128, 1),
            onTap: (tabIndex) {},
          ),
        ),
        actions: [
          IconBox(
            icon: Icons.location_on_outlined,
            onPressed: null,
            color: storeType.isMarket ? Colors.white : primaryColor,
          ),
          Stack(alignment: Alignment.center, children: [
            IconBox(
              icon: Icons.shopping_cart_outlined,
              onPressed: () => context.push('/cart-list').whenComplete(() => context.read<CartListBloc>().add(CartListSelectedAll())),
              color: storeType.isMarket ? Colors.white : primaryColor,
            ),
            Positioned(
              top: 10,
              right: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: storeType.isMarket ? Colors.white : primaryColor,
                  shape: BoxShape.circle,
                ),
                width: 16,
                height: 16,
                child: Center(
                  child: Text(
                    '$cartCount',
                    style: TextStyle(
                      color: storeType.isMarket ? primaryColor : Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(width: 8),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        // backgroundColor: (storeType.isMarket) ? null : Colors.white,
        centerTitle: true,
      ),
    );
  }
}
