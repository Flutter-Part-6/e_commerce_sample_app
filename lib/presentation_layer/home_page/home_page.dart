import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/dependency_injection/injection_injectable.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import 'package:sample_app/presentation_layer/home_page/component/collections_bar/collections_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartBloc>()..add(CartInitialized()),
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
