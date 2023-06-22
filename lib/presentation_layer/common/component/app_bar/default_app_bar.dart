import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import '../../bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final type = context.watch<BottomNavigationCubit>().state.name;

    return AppBar(
      title: Text(
        type == 'user' ? '마이페이지' : type,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(
              color: Theme.of(context).colorScheme.contentPrimary,
            )
            .semiBold,
      ),
      elevation: 0,
      backgroundColor: type == 'user' ? AppColors.white : null,
      centerTitle: true,
    );
  }
}
