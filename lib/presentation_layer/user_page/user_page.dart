import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/user_page/bloc/user_bloc/user_bloc.dart';

import '../../common/dependency_injection/injection_injectable.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return Center(
              child: TextButton(
                onPressed: () {
                  context.read<UserBloc>().add(UserLogin());
                },
                child: const Text('KAKAOLOGIN'),
              ),
            );

          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.success:
            return const UserList();

          case Status.error:
            return const Center(child: Text('error'));
        }
      },
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserBloc>().state.user;

    return SingleChildScrollView(
      child: Center(
        child: user == null
            ? TextButton(
                onPressed: () {
                  context.read<UserBloc>().add(UserLogin());
                },
                child: const Text('KAKAOLOGIN'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Image.network(
                          user.kakaoAccount?.profile?.profileImageUrl ?? '',
                          height: 200,
                          width: 200,
                        ),
                        Text(user.kakaoAccount?.profile?.nickname.toString() ??
                            '??'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      context.read<UserBloc>().add(UserLogout());
                    },
                    child: const Text('LOGOUT'),
                  )
                ],
              ),
      ),
    );
  }
}
