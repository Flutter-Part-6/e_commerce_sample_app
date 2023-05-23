import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(95, 0, 128, 1),
      body: BlocListener<UserBloc, UserState>(
        child: Center(
          child: Text(
            'Kerly',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        listener: (context, state) {
          // success : 로그인 성공
          // error : 로그인 실패
          // initial : 로그인 정보 없음
          if (state.status == Status.success ||
              state.status == Status.error ||
              state.status == Status.initial) {
            context.go('/');
          }
        },
      ),
    );
  }
}
