import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample_app/common/utils/logger.dart';
import 'package:sample_app/presentation_layer/common/component/server_selector.dart';
import 'package:sample_app/presentation_layer/common/utils/dialog/common_dialog.dart';

import 'package:volume_controller/volume_controller.dart';

import '../../common/constants.dart';
import '../../common/dependency_injection/dependency_injection.dart';
import '../common/component/home_place_holder.dart';
import 'bloc/home_page_bloc.dart';
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
    return BlocProvider(
      create: (_) => getIt<ViewModulesBloc>(),
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollectionsBloc, CollectionsState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const HomePlaceholder();
          case Status.loading:
            return HomeView(key: ValueKey<StoreType>(state.storeType));
          case Status.success:
            return const HomeView();
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
