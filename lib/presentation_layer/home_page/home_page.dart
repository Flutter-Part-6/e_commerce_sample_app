import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:volume_controller/volume_controller.dart';

import '../common/bloc/mall_type_cubit/mall_type_cubit.dart';
import '../common/utils/dialog/server_selector.dart';
import '../common/utils/dialog/common_dialog.dart';
import '../../common/constants.dart';
import '../../common/dependency_injection/dependency_injection.dart';
import 'component/global_nav/global_nav_bar.dart';
import 'component/global_nav/global_nav_bar_view.dart';
import 'component/home_placeholder.dart';
import 'bloc/home_page_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MenuBloc>()
            ..add(MenuInitialized(mallType: MallType.market)),
        ),
      ],
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MallTypeCubit, MallTypeState>(
      listener: (_, state) => context
          .read<MenuBloc>()
          .add(MenuInitialized(mallType: state.mallType)),
      listenWhen: (prev, curr) => prev.mallType != curr.mallType,
      child: BlocConsumer<MenuBloc, MenuState>(
        builder: (context, state) {
          final mallType = state.mallType;
          final menus = state.menus;

          switch (state.status) {
            case Status.initial:
              return const HomePlaceholder();
            case Status.loading:
              return DefaultTabController(
                length: menus.length,
                child: Column(
                  children: [
                    GlobalNavBar(menus),
                    GlobalNavBarView(mallType, menus),
                  ],
                ),
              );
            case Status.success:
              return DefaultTabController(
                key: ValueKey<MallType>(mallType),
                length: menus.length,
                child: Column(
                  children: [
                    GlobalNavBar(menus),
                    GlobalNavBarView(mallType, menus),
                  ],
                ),
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
      ),
    );
  }
}
