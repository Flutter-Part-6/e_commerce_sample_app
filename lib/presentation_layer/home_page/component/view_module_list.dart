import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import '../../../common/dependency_injection/injection_injectable.dart';
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

class _BuildViewModuleList extends StatefulWidget {
  const _BuildViewModuleList({super.key});

  @override
  State<_BuildViewModuleList> createState() => _BuildViewModuleListState();
}

class _BuildViewModuleListState extends State<_BuildViewModuleList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = context.watch<ViewModulesBloc>().state;
    final status = state.status;
    final viewModules = state.viewModules;

    if (status.isFailure) {
      return const ViewModuleListFailure();
    }
    return RefreshIndicator(
      onRefresh: () async => context.read<ViewModulesBloc>().add(
          ViewModulesInitialized(
              storeType: state.storeType, tabId: state.tabId, isRefresh: true)),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: (status.isInitial || viewModules.isEmpty)
            ? const ViewModuleListLoading(color: Colors.green)
            : Column(
                children: [
                  ...viewModules,
                  (status.isLoading)
                      ? const BottomLoader()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ViewModulesBloc>().add(ViewModulesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 1.5),
        ),
      ),
    );
  }
}

class ViewModuleListLoading extends StatelessWidget {
  const ViewModuleListLoading({
    required this.color,
    Key? key,
  }) : super(key: key);

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

class ViewModuleListFailure extends StatelessWidget {
  const ViewModuleListFailure({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Center(
        child: CircularProgressIndicator(color: Colors.red),
      ),
    );
  }
}
