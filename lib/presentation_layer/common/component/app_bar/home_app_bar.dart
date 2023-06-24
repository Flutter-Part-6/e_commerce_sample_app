import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme.dart';
import '../../../../theme/app_bar_theme.dart';
import '../../../../theme/app_icons.dart';
import '../../../../theme/typography.dart';
import '../../../cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../../../common/constants.dart';
import '../../../routes.dart';
import '../../bloc/mall_type_cubit/mall_type_cubit.dart';
import 'widget/icon_box.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallTypeState>(
      builder: (context, state) {
        final colorTheme = state.mallType.theme;
        final textTheme = Theme.of(context).textTheme;
        final cartCount = context.watch<CartListBloc>().state.cartList.length;

        return AnimatedContainer(
          color: colorTheme.backgroundColor,
          child: AppBar(
            leading: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 8),
              child: SvgPicture.asset(
                AppIcons.mainLogo,
                colorFilter: ColorFilter.mode(
                  colorTheme.logoColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: AnimatedContainer(
              decoration: BoxDecoration(
                color: colorTheme.containerColor,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: SizedBox(
                height: 28,
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    tabs: [
                      Tab(text: MallType.market.toName),
                      Tab(text: MallType.beauty.toName),
                    ],
                    isScrollable: true,
                    indicatorWeight: 0,
                    indicator: BoxDecoration(
                      color: colorTheme.logoColor,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: colorTheme.labelColor,
                    labelStyle: textTheme.labelLarge.bold,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12.5),
                    unselectedLabelColor: colorTheme.unselectedLabelColor,
                    unselectedLabelStyle: textTheme.labelLarge,
                    onTap: context.read<MallTypeCubit>().changeMallType,
                    splashBorderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              duration:
                  Duration(milliseconds: CustomAppBarTheme.animationDuration),
            ),
            actions: [
              IconBox(
                icon: AppIcons.location,
                color: colorTheme.iconColor,
                onPressed: null,
              ),
              const SizedBox(width: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  IconBox(
                    icon: AppIcons.cart,
                    color: colorTheme.iconColor,
                    onPressed: () => context.push(Routes.cartPath),
                  ),
                  //TODO 장바구니 뱃지 디자인 수정
                  Positioned(
                    top: 2,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorTheme.badgeBgColor,
                        shape: BoxShape.circle,
                      ),
                      width: 13,
                      height: 13,
                      child: Center(
                        child: Text(
                          '$cartCount',
                          style: TextStyle(
                            color: colorTheme.badgeNumColor,
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
            backgroundColor: Colors.transparent,
            centerTitle: true,
            toolbarHeight: CustomTheme.appBarHeight,
            leadingWidth: 86,
            systemOverlayStyle: colorTheme.systemUiOverlayStyle,
          ),
          duration: Duration(milliseconds: CustomAppBarTheme.animationDuration),
        );
      },
    );
  }
}

// class HomeAppBar extends StatefulWidget {
//   const HomeAppBar({super.key});
//
//   @override
//   State<HomeAppBar> createState() => _HomeAppBarState();
// }
//
// class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _tabController = TabController(
//       length: 2,
//       vsync: this,
//     );
//   }
//
//   void _onTap(int tabIndex) {
//     context.read<MenuBloc>().add(ToggledMallTypes(tabIndex));
//   }
//
//   @override
//   void didChangeDependencies() {
//     final currentIndex = context.watch<MenuBloc>().state.mallType.index;
//     if (_tabController.index == currentIndex) return;
//     _tabController.index = currentIndex;
//     super.didChangeDependencies();
//   }
//
//   Color primary(MallType mallType, {bool isContainer = false}) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     if (isContainer) {
//       return mallType.isMarket
//           ? colorScheme.primaryContainer
//           : colorScheme.surface;
//     }
//
//     return mallType.isMarket ? colorScheme.primary : colorScheme.onPrimary;
//   }
//
//   Color onPrimary(MallType mallType) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return mallType.isMarket ? colorScheme.onPrimary : colorScheme.primary;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartCount = context.watch<CartListBloc>().state.cartList.length;
//     final mallType = context.watch<MenuBloc>().state.mallType;
//     final textTheme = Theme.of(context).textTheme;
//
//     return AnimatedContainer(
//       color: mallType.isMarket ? colorScheme.primary : colorScheme.onPrimary,
//       child: SafeArea(
//         child: AppBar(
//           leading: Container(
//             padding: EdgeInsets.all(8),
//             margin: EdgeInsets.only(left: 8),
//             child: SvgPicture.asset(
//               AppIcons.mainLogo,
//               color: onPrimary(mallType),
//             ),
//           ),
//           title: AnimatedContainer(
//             decoration: BoxDecoration(
//               color: primary(mallType, isContainer: true),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(16),
//               ),
//             ),
//             height: 28,
//             child: TabBar(
//               tabs: [
//                 Tab(text: MallType.market.toName),
//                 Tab(text: MallType.beauty.toName),
//               ],
//               controller: _tabController,
//               isScrollable: true,
//               indicatorWeight: 0,
//               indicator: BoxDecoration(
//                 color: onPrimary(mallType),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(16),
//                 ),
//               ),
//               indicatorSize: TabBarIndicatorSize.tab,
//               dividerColor: Colors.transparent,
//               labelColor: primary(mallType),
//               labelStyle: textTheme.labelLarge.bold,
//               labelPadding: EdgeInsets.symmetric(horizontal: 12.5),
//               unselectedLabelColor: (mallType.isMarket)
//                   ? Theme.of(context).colorScheme.onPrimary
//                   : Theme.of(context).colorScheme.contentPrimary,
//               unselectedLabelStyle: textTheme.labelLarge,
//               onTap: _onTap,
//               splashBorderRadius: const BorderRadius.all(
//                 Radius.circular(16),
//               ),
//             ),
//             duration: Duration(milliseconds: 300),
//           ),
//           actions: [
//             IconBox(
//               icon: AppIcons.location,
//               color: mallType.isMarket
//                   ? Theme.of(context).colorScheme.onPrimary
//                   : Theme.of(context).colorScheme.contentPrimary,
//               onPressed: null,
//             ),
//             const SizedBox(width: 8),
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 IconBox(
//                   icon: AppIcons.cart,
//                   color: mallType.isMarket
//                       ? Theme.of(context).colorScheme.onPrimary
//                       : Theme.of(context).colorScheme.contentPrimary,
//                   onPressed: () => context.push(Routes.cartPath),
//                 ),
//                 //TODO 장바구니 뱃지 디자인 수정
//                 Positioned(
//                   top: 2,
//                   right: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: onPrimary(mallType),
//                       shape: BoxShape.circle,
//                     ),
//                     width: 13,
//                     height: 13,
//                     child: Center(
//                       child: Text(
//                         '$cartCount',
//                         style: TextStyle(
//                           color: primary(mallType),
//                           fontSize: 9,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 8),
//           ],
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           centerTitle: true,
//           toolbarHeight: 44,
//           leadingWidth: 86,
//         ),
//       ),
//       duration: Duration(milliseconds: 400),
//     );
//   }
// }
