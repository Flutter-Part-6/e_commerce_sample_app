import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/view_modules_bloc/view_modules_bloc.dart';

//Test 용 color map
const testColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.cyan,
  Colors.teal,
  Colors.lime,
  Colors.purple,
];

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({required this.tabIndex, super.key});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModulesBloc, ViewModulesState>(
      builder: (context, state) {
        final viewModules = state.viewModules;
        final status = state.status[tabIndex];
        final collections = state.collections;
        switch (status) {
          case ViewModulesStatus.initial:
            return const LoadingViewModuleList(Colors.green);
          case ViewModulesStatus.loading:
            return const LoadingViewModuleList(Colors.blue);
          case ViewModulesStatus.success:
            final tabId = collections[tabIndex].tabId;
            return SingleChildScrollView(
              child: Column(
                children: (viewModules[tabId] ?? [])
                    .asMap()
                    .entries
                    .map(
                      (e) => Container(
                        height: 200,
                        color: testColors[e.key],
                        child: Center(
                          child: Text(e.value.type),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          case ViewModulesStatus.failure:
            return const LoadingViewModuleList(Colors.red);
          default:
            return const LoadingViewModuleList(Colors.black);
        }
      },
    );
  }
}

class LoadingViewModuleList extends StatelessWidget {
  const LoadingViewModuleList(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
