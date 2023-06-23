import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_icons.dart';
import '../common/bloc/user_bloc/user_bloc.dart';
import '../../common/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state.status.isSuccess ||
              state.status.isError ||
              state.status.isInitial) {
            Future.delayed(
              Duration(milliseconds: 1000),
              () {
                context.go('/home');
              },
            );
          }
        },
        child: Center(
          child: SvgPicture.asset(
            AppIcons.mainLogo,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
