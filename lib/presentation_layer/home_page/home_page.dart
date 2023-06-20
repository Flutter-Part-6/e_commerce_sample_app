import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample_app/presentation_layer/common/component/server_selector.dart';
import 'package:sample_app/presentation_layer/common/utils/common_dialog.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';

import 'package:volume_controller/volume_controller.dart';

import '../../common/constants.dart';
import '../common/component/home_place_holder.dart';
import 'component/home_view/home_view.dart';

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

    if (dotenv.env['FLAVOR'] == 'dev') {
      VolumeController().listener((volume) {
        if (!isInitialized) {
          isInitialized = true;

          return;
        }
        _showServerSelector();
      });
    }
  }

  void _showServerSelector() async {
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
    return BlocConsumer<CollectionsBloc, CollectionsState>(
      builder: (context, state) {
        final collections = state.collections;
        switch (state.status) {
          case Status.initial:
            return const HomePlaceholder();
          case Status.loading:
            return HomeView(
              storeType: state.storeType,
              collections: collections,
              key: ValueKey<StoreType>(state.storeType),
            );
          case Status.success:
            return HomeView(
              storeType: state.storeType,
              collections: collections,
            );
          case Status.error:
            return const HomePlaceholder();
        }
      },
      listener: (context, state) {
        if (state.status.isError) {
          CommonDialog.networkErrorDialog(context);
        }
      },
      listenWhen: (prev, cur) => prev.status != cur.status,
    );
  }
}
