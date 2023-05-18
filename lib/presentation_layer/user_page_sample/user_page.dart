import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:sample_app/injection_injectable.dart';
import 'package:sample_app/presentation_layer/user_page_sample/bloc/user_bloc/user_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<UserBloc>()..add(UserInitialized()),
        ),
      ],
      child: const KaKaoLoginView(),
    );
  }
}

class KaKaoLoginView extends StatefulWidget {
  const KaKaoLoginView({Key? key}) : super(key: key);

  @override
  State<KaKaoLoginView> createState() => _KaKaoLoginViewState();
}

class _KaKaoLoginViewState extends State<KaKaoLoginView> {
  String username = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      OAuthToken? token =
          await TokenManagerProvider.instance.manager.getToken();
      var loginInfo = JwtDecoder.decode(token?.idToken ?? '');
      if (loginInfo.isNotEmpty) {
        setState(() {
          username = loginInfo['nickname'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(username),
          username.isEmpty
              ? TextButton(
                  onPressed: () async {
                    if (await isKakaoTalkInstalled()) {
                    } else {
                      OAuthToken token =
                          await UserApi.instance.loginWithKakaoAccount();
                      var loginInfo = JwtDecoder.decode(token.idToken ?? '');
                      setState(() {
                        username = loginInfo['nickname'];
                      });
                    }
                  },
                  child: const Text('KAKAO Login'),
                )
              : TextButton(
                  onPressed: () async {
                    if (await isKakaoTalkInstalled()) {
                    } else {
                      await UserApi.instance.logout();

                      setState(() {
                        username = '';
                      });
                    }
                  },
                  child: const Text('Logout'),
                ),
        ],
      ),
    );
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
            return const Stack(
              alignment: Alignment.center,
              children: [
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
