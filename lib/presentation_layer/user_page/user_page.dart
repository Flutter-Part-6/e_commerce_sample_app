import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return Center(
              child: SizedBox(
                width: 300,
                child: TextButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.zero,
                    ),
                  ),
                  onPressed: () {
                    context.read<UserBloc>().add(UserLogin());
                  },
                  child: Image.asset('assets/kakao_login_large_narrow.png'),
                ),
              ),
            );

          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case Status.success:
            return const UserProfile();

          case Status.error:
            return const Center(child: Text('error'));
        }
      },
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserBloc>().state.user;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                user?.kakaoAccount?.profile?.profileImageUrl ?? '',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              user?.kakaoAccount?.profile?.nickname.toString() ?? '무명의 사용자',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () async {
                  context.read<UserBloc>().add(UserLogout());
                },
                child: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
