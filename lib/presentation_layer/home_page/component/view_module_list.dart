import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/injection_injectable.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/view_modules/core/view_module_factory.dart';

import '../bloc/view_modules_bloc/view_modules_bloc.dart';

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({required this.tabId, required this.storeType, Key? key})
      : super(key: key);

  final int tabId;
  final StoreType storeType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ViewModulesBloc>()
        ..add(ViewModulesInitialized(storeType: storeType, tabId: tabId)),
      child: const _BuildViewModuleList(),
    );
  }
}

class _BuildViewModuleList extends StatelessWidget {
  const _BuildViewModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    ViewModuleFactory viewModuleFactory = ViewModuleFactory();
    return BlocBuilder<ViewModulesBloc, ViewModulesState>(
      builder: (context, state) {
        switch (state.status) {
          case ViewModulesStatus.initial:
            return const LoadingViewModuleList(Colors.green);
          case ViewModulesStatus.loading:
            return const LoadingViewModuleList(Colors.blue);
          case ViewModulesStatus.success:
            final viewModules = state.viewModules;
            return SingleChildScrollView(
              child: Column(
                children: viewModules
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
