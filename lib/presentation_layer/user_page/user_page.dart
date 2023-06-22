import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/custom_theme.dart';
import '../../theme/typography.dart';
import '../common/bloc/user_bloc/user_bloc.dart';
import '../../common/constants.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60.0,
                ),
                child: Column(
                  children: [
                    Text(
                      '''간편하게 로그인하고\n패캠마켓의\n다양한 서비스를 이용해보세요.''',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.contentPrimary,
                          )
                          .regular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () =>
                            context.read<UserBloc>().add(UserLogin()),
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.zero,
                          ),
                        ),
                        child: Image.asset(
                          AppIcons.kakaoLogin,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
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
      ),
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
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            ClipOval(
              child: Image.network(
                user?.kakaoAccount?.profile?.profileImageUrl ?? '',
                width: 110,
                height: 110,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              user?.kakaoAccount?.profile?.nickname.toString() ?? '무명의 사용자',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    color: AppColors.black,
                  )
                  .regular,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(
                        UserLogout(),
                      );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).primaryColor,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    '로그아웃',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                          color: AppColors.white,
                        )
                        .regular,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
