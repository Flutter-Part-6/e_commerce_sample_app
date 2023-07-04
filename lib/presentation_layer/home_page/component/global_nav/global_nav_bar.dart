import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../domain_layer/model/display/menu/menu.model.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
import '../../bloc/home_page_bloc.dart';

class GlobalNavBar extends StatelessWidget {
  const GlobalNavBar(this.menus, {super.key});

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return SizedBox(
          height: 46,
          child: Stack(
            children: [
              TabBar(
                tabs: List.generate(
                  menus.length,
                  (index) => Tab(text: menus[index].title),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: colorScheme.primary,
                labelStyle: textTheme.titleSmall.semiBold,
                labelPadding: EdgeInsets.symmetric(horizontal: 8),
                unselectedLabelColor: colorScheme.contentSecondary,
                unselectedLabelStyle: textTheme.titleSmall,
                onTap: (index) {},
              ),
              if (state.status.isLoading)
                Center(
                  child: Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
