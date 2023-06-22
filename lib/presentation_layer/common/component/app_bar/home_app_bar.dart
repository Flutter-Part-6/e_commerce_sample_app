import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_icons.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import '../../../cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../../home_page/bloc/collections_bloc/collections_bloc.dart';
import '../../../../common/constants.dart';
import '../../../routes.dart';
import 'widget/icon_box.dart';

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
    );
  }

  void _onTap(int tabIndex) {
    context.read<CollectionsBloc>().add(ToggledStoreTypes(tabIndex));
  }

  @override
  void didChangeDependencies() {
    final currentIndex = context.watch<CollectionsBloc>().state.storeType.index;
    if (_tabController.index == currentIndex) return;
    _tabController.index = currentIndex;
    super.didChangeDependencies();
  }

  Color primary(StoreType storeType, {bool isContainer = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isContainer) {
      return storeType.isMarket
          ? colorScheme.primaryContainer
          : colorScheme.surface;
    }

    return storeType.isMarket ? colorScheme.primary : colorScheme.onPrimary;
  }

  Color onPrimary(StoreType storeType) {
    final colorScheme = Theme.of(context).colorScheme;

    return storeType.isMarket ? colorScheme.onPrimary : colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartListBloc>().state.cartList.length;
    final storeType = context.watch<CollectionsBloc>().state.storeType;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      color: storeType.isMarket ? colorScheme.primary : colorScheme.onPrimary,
      child: SafeArea(
        child: AppBar(
          leading: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 8),
            child: SvgPicture.asset(
              AppIcons.mainLogo,
              color: onPrimary(storeType),
            ),
          ),
          title: AnimatedContainer(
            decoration: BoxDecoration(
              color: primary(storeType, isContainer: true),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            height: 28,
            child: TabBar(
              tabs: [
                Tab(text: StoreType.market.toName),
                Tab(text: StoreType.beauty.toName),
              ],
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 0,
              indicator: BoxDecoration(
                color: onPrimary(storeType),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: primary(storeType),
              labelStyle: textTheme.labelLarge.bold,
              labelPadding: EdgeInsets.symmetric(horizontal: 12.5),
              unselectedLabelColor: (storeType.isMarket)
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.contentPrimary,
              unselectedLabelStyle: textTheme.labelLarge,
              onTap: _onTap,
              splashBorderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          actions: [
            IconBox(
              icon: AppIcons.location,
              color: storeType.isMarket
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.contentPrimary,
              onPressed: null,
            ),
            const SizedBox(width: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                IconBox(
                  icon: AppIcons.cart,
                  color: storeType.isMarket
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.contentPrimary,
                  onPressed: () => context.push(Routes.cartPath),
                ),
                //TODO 장바구니 뱃지 디자인 수정
                Positioned(
                  top: 2,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: onPrimary(storeType),
                      shape: BoxShape.circle,
                    ),
                    width: 13,
                    height: 13,
                    child: Center(
                      child: Text(
                        '$cartCount',
                        style: TextStyle(
                          color: primary(storeType),
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          toolbarHeight: 44,
          leadingWidth: 86,
        ),
      ),
      duration: Duration(milliseconds: 400),
    );
  }
}
