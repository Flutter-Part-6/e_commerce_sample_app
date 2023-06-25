import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_page_bloc.dart';
import '../home_placeholder.dart';
import '../../../../common/constants.dart';
import '../footer/footer.dart';
import 'widget/bottom_loader.dart';

class ViewModuleList extends StatefulWidget {
  const ViewModuleList({required this.mallType, required this.tabId});

  final int tabId;
  final MallType mallType;

  @override
  State<ViewModuleList> createState() => _ViewModuleListState();
}

class _ViewModuleListState extends State<ViewModuleList> with AutomaticKeepAliveClientMixin{
  void _onRefresh(MallType mallType, int tabId) {
    context.read<ViewModulesBloc>().add(
          ViewModulesInitialized(
            mallType: mallType,
            tabId: tabId,
            isRefresh: true,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      child: NotificationListener(
        child: SingleChildScrollView(
          child: BlocBuilder<ViewModulesBloc, ViewModulesState>(
            builder: (context, state) {
              final status = state.status;
              final viewModules = state.viewModules;
              if (status.isError) {
                return const HomePlaceholder();
              }

              return (status.isInitial || viewModules.isEmpty)
                  ? const HomePlaceholder()
                  : Column(children: [
                      ...viewModules,
                      if (status.isLoading) const BottomLoader(),
                      const HomeFooter(),
                    ]);
            },
          ),
        ),
        onNotification: (ScrollNotification scrollNotification) {
          final maxScroll = scrollNotification.metrics.maxScrollExtent;
          final currentScroll = scrollNotification.metrics.pixels;

          if (currentScroll >= (maxScroll * 0.9)) {
            context.read<ViewModulesBloc>().add(ViewModulesFetched());
          }

          return false;
        },
      ),
      onRefresh: () async => _onRefresh(widget.mallType, widget.tabId),
    );
  }

@override
bool get wantKeepAlive => true;
}
