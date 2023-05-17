import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/view_modules/core/view_module_factory.dart';
import '../bloc/view_modules_bloc/view_modules_bloc.dart';

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({required this.tabIndex, super.key});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    ViewModuleFactory viewModuleFactory = ViewModuleFactory();

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
                    .map((viewModuleInfo) =>
                        viewModuleFactory.textToWidget(viewModuleInfo))
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
