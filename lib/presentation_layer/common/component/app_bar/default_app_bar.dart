import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/common/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final type = context.watch<BottomNavigationCubit>().state.name;

    return AppBar(
      elevation: 0,
      actions: const [
        IconButton(
          icon: Icon(Icons.hub),
          color: Colors.white,
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: null,
        ),
      ],
      centerTitle: true,
      title: Text(type),
    );
  }
}
