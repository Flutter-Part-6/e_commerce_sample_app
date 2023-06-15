import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/dependency_injection/injection_injectable.dart';
import 'package:sample_app/presentation_layer/common/component/server_selector.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import 'package:sample_app/presentation_layer/home_page/component/collections_bar/collections_bar.dart';
import 'package:volume_controller/volume_controller.dart';

import '../common/component/home_place_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInitialized = false;
  bool isDialogOpened = false;

  @override
  void initState() {
    super.initState();

    VolumeController().listener((volume) {
      if (!isInitialized) {
        isInitialized = true;

        return;
      }
      _showServerSelector(context);
    });
  }

  void _showServerSelector(
    BuildContext context,
  ) async {
    if (isDialogOpened) {
      return;
    }

    isDialogOpened = true;
    await showDialog<bool>(
      context: context,
      builder: (_) {
        return ServerSelector();
      },
    );
    isDialogOpened = false;
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartBloc>()..add(CartInitialized()),
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsBloc, CollectionsState>(
      builder: (context, state) {
        final collections = state.collections;
        switch (state.status) {
          case CollectionsStatus.initial:
            return const HomePlaceholder();
          case CollectionsStatus.loading:
            return CollectionsBar(
              storeType: state.storeType,
              collections: collections,
              key: ValueKey<StoreType>(state.storeType),
            );
          case CollectionsStatus.success:
            return CollectionsBar(
              storeType: state.storeType,
              collections: collections,
            );
          case CollectionsStatus.failure:
            return const HomePlaceholder();
        }
      },
    );
  }
}
