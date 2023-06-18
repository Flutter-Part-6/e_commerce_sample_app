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
    print('[test] ---------- main_page build ----------');

    return Scaffold(
      appBar: TopAppBar(AppBar()),
      body: BlocBuilder<BottomNavigationCubit, BottomNavigation>(
        builder: (context, state) {
          switch (state) {
            case BottomNavigation.A:
              return const HomePage();
            case BottomNavigation.B:
              return const PageSample(Colors.red);
            case BottomNavigation.C:
              return const PageSample(Colors.green);
            case BottomNavigation.user:
              return const UserPage();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: BottomNavigation.A.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_outlined),
            label: BottomNavigation.B.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            label: BottomNavigation.C.name,
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

class PageSample extends StatelessWidget {
  const PageSample(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BottomNavigationCubit>().state;
    final storeType = context.watch<CollectionsBloc>().state.storeType;

    return Center(
      child: Column(
        children: [
          Container(
            color: color,
            width: 200,
            height: 200,
            child: Center(
              child: Text(storeType.name),
            ),
          ),
          Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Center(
              child: Text(state.name),
            ),
          ),
        ],
      ),
    );
  }
}
