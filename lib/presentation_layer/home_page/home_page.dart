import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import 'package:sample_app/presentation_layer/home_page/component/collections_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('[test] ---------- home_page build ----------');
    return BlocBuilder<CollectionsBloc, CollectionsState>(
        builder: (context, state) {
      final collections = state.collections;
      switch (state.status) {
        case CollectionsStatus.initial:
          return const LoadingCollectionsBar();
        case CollectionsStatus.loading:
          return const LoadingCollectionsBar();
        case CollectionsStatus.success:
          return CollectionsBar(
            storeType: state.storeType,
            collections: collections,
          );
        case CollectionsStatus.failure:
          return const LoadingCollectionsBar();
      }
    });
  }
}

class LoadingCollectionsBar extends StatelessWidget {
  const LoadingCollectionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
