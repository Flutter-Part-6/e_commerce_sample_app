import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample_app/presentation_layer/common/component/app_bar/top_app_bar.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/home_page.dart';

import '../common/constants.dart';
import '../common/dependency_injection/injection_injectable.dart';
import 'common/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'user_page/user_page.dart';

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
      body: BlocBuilder<BottomNavigationCubit, BottomNavigation>(
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: BottomNavigation.home.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_outlined),
            label: BottomNavigation.category.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            label: BottomNavigation.search.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline_outlined),
            label: BottomNavigation.user.name,
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
