import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'default_app_bar.dart';
import 'home_app_bar.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar(this.appBar, {super.key});

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigation>(
      builder: (context, state) =>
          (state.index == 0) ? const HomeAppBar() : const DefaultAppBar(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44);
}
