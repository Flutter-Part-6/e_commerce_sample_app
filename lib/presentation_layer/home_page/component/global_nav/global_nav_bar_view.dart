import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../common/dependency_injection/dependency_injection.dart';
import '../../../../domain_layer/model/display/menu/menu.model.dart';
import '../../bloc/home_page_bloc.dart';
import '../view_modules/view_module_list.dart';

class GlobalNavBarView extends StatelessWidget {
  const GlobalNavBarView(this.mallType, this.menus, {super.key});

  final MallType mallType;
  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Expanded(
          child: TabBarView(
            children: List.generate(
              state.menus.length,
              (index) {
                return BlocProvider(
                  create: (_) => getIt<ViewModulesBloc>()
                    ..add(
                      ViewModulesInitialized(
                        mallType: mallType,
                        tabId: menus[index].tabId,
                      ),
                    ),
                  child: ViewModuleList(
                    mallType: state.mallType,
                    tabId: state.menus[index].tabId,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
