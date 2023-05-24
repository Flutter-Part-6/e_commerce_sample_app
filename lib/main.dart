import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';

import 'package:sample_app/presentation_layer/common/bloc/bloc_test_observer.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';
import 'package:sample_app/presentation_layer/router.dart';
import 'package:sample_app/theme.dart';

import 'common/dependency_injection/injection_injectable.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dependency set up
  configureDependencies();

  // Hive 등록
  await Hive.initFlutter();
  Hive.registerAdapter(ViewModuleEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  Hive.registerAdapter(ProductInfoEntityAdapter());
  Bloc.observer = BlocTestObserver();

  // 카카오 로그인 init
  KakaoSdk.init(
    nativeAppKey: '131a1167cce7a54b528d70f41dd7be0f',
  );

  // firebase initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<UserBloc>()
              ..add(
                UserLoginWithToken(),
              )),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: CustomTheme.theme,
      ),
    );
  }
}
