import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample_app/injection.dart';
import 'package:sample_app/presentation_layer/user_page_sample/bloc/user_bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => serviceLocater<UserBloc>()..add(UserInitialized()),
      ),
    ], child: const UserView());
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const SizedBox.shrink();

          case Status.loading:
            return Stack(
              alignment: Alignment.center,
              children: const [
                UserList(),
                Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              ],
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
    final users = context.watch<UserBloc>().state.users;

    return SingleChildScrollView(
      child: Column(
        children: users
            .map(
              (user) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide())),
                  child: Center(child: Text(user.name)),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
