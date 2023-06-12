import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_list_builder.dart';

import '../../../../common/dependency_injection/injection_injectable.dart';
import '../../bloc/view_modules_bloc/view_modules_bloc.dart';
import '../footer/footer.dart';
import 'common/bottom_loader.dart';

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
      child: const _BuildViewModules(),
    );
  }
}

class _BuildViewModules extends StatefulWidget {
  const _BuildViewModules();

  @override
  State<_BuildViewModules> createState() => _BuildViewModulesState();
}

class _BuildViewModulesState extends State<_BuildViewModules>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) context.read<ViewModulesBloc>().add(ViewModulesFetched());
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final state = context.read<ViewModulesBloc>().state;

    return RefreshIndicator(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: BlocBuilder<ViewModulesBloc, ViewModulesState>(
          builder: (context, state) {
            final status = state.status;
            final viewModules = state.viewModules;
            if (status.isFailure) {
              return const ViewModuleListBuilder();
            }

            return (status.isInitial || viewModules.isEmpty)
                ? const ViewModuleListBuilder()
                : Column(
                    children: [
                      ...viewModules,
                      if (status.isLoading) const BottomLoader(),
                      const HomeFooter(),
                    ],
                  );
          },
        ),
      ),
      onRefresh: () async => context.read<ViewModulesBloc>().add(
            ViewModulesInitialized(
              storeType: state.storeType,
              tabId: state.tabId,
              isRefresh: true,
            ),
          ),
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }
}
