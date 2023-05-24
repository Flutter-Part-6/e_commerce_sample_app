import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/category_product.view_module.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryProduct();

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(UserLogin());
                },
                child: const Text("KAKAO LOGIN"),
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
            Text(user?.kakaoAccount?.profile?.nickname.toString() ?? '무명의 사용자'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
