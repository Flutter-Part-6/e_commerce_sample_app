import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/constants.dart';
import '../common/dependency_injection/dependency_injection.dart';
import '../theme/app_icons.dart';
import 'common/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'common/utils/bottom_sheet/cart_bottom_sheet/cart_bottom_sheet.dart';
import 'common/utils/snack_bar/common_snack_bar.dart';
import 'home_page/bloc/cart_bloc/cart_bloc.dart';
import 'user_page/user_page.dart';
import 'common/component/app_bar/top_app_bar.dart';
import 'home_page/bloc/collections_bloc/collections_bloc.dart';
import 'home_page/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationCubit()),
        BlocProvider(
          create: (_) => getIt<CollectionsBloc>()
            ..add(CollectionsInitialized(storeType: StoreType.market)),
        ),
      ],
      child: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(AppBar()),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) async {
          final bottomSheet = cartBottomSheet(context)
              .whenComplete(() => context.read<CartBloc>().add(CartClosed()));
          final isSuccess = await bottomSheet ?? false;

          if (isSuccess) {
            CommonSnackBar.addCartSnackBar(context);
          }
        },
        listenWhen: (pre, cur) => pre.status.isClose && cur.status.isOpen,
        child: BlocBuilder<BottomNavigationCubit, BottomNavigation>(
          builder: (context, state) {
            switch (state) {
              case BottomNavigation.home:
                return const HomePage();
              case BottomNavigation.category:
                return const SamplePage();
              case BottomNavigation.search:
                return const SamplePage();
              case BottomNavigation.user:
                return const UserPage();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.navHome),
            label: BottomNavigation.home.name,
            activeIcon: SvgPicture.asset(AppIcons.navHomeOn),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.navCategory),
            label: BottomNavigation.category.name,
            activeIcon: SvgPicture.asset(AppIcons.navCategoryOn),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.navSearch),
            label: BottomNavigation.search.name,
            activeIcon: SvgPicture.asset(AppIcons.navSearchOn),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.navUser),
            label: BottomNavigation.user.name,
            activeIcon: SvgPicture.asset(AppIcons.navUserOn),
          ),
        ],
        onTap: context.read<BottomNavigationCubit>().changeBottomType,
        currentIndex: context.watch<BottomNavigationCubit>().state.index,
        type: BottomNavigationBarType.fixed,
        iconSize: 36,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storeType = context.watch<CollectionsBloc>().state.storeType;
    final name = context.watch<BottomNavigationCubit>().state.name;

    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(storeType.name),
                Text(name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
