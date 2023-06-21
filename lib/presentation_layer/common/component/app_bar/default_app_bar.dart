import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final type = context.watch<BottomNavigationCubit>().state.name;

    return AppBar(
      title: Text(type == 'user' ? '마이페이지' : type),
      actions: [
        // IconButton(
        //   color: Colors.white,
        //   onPressed: null,
        //   icon: Icon(Icons.hub),
        // ),
        // IconButton(
        //   color: Colors.white,
        //   onPressed: null,
        //   icon: Icon(Icons.search),
        // ),
      ],
      elevation: 0,
      centerTitle: true,
    );
  }
}
