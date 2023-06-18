import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          print('========== ${state.status == Status.error}');
          if (state.status == Status.success ||
              state.status == Status.error ||
              state.status == Status.initial) {
            Future.delayed(
              Duration(milliseconds: 1000),
              () {
                context.go('/home');
              },
            );
          }
        },
        child: Center(
          child: Text(
            'FLUTTER',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
