import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';

import 'package:sample_app/presentation_layer/common/bloc/bloc_test_observer.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';
import 'package:sample_app/presentation_layer/router.dart';
import 'package:sample_app/theme.dart';

import 'common/dependency_injection/injection_injectable.dart';

void main(name, options) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive 등록
  await Hive.initFlutter();
  await Hive.openBox('settings');

  Hive.registerAdapter(ViewModuleEntityAdapter());
  Hive.registerAdapter(ViewModuleListEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  Hive.registerAdapter(ProductInfoEntityAdapter());
  Bloc.observer = BlocTestObserver();

  // dependency set up
  configureDependencies();

  // 카카오 로그인 init
  KakaoSdk.init(
    nativeAppKey: 'aee609c5d69eea0d7ca44f09c467b87c',
  );

  // firebase initialize
  await Firebase.initializeApp(
    name: name,
    options: options,
  );

  // firebase Crashlystics 초기화
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

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
            ),
        ),
        BlocProvider(
          create: (_) => getIt<CartListBloc>()
            ..add(
              CartListInitialized(),
            ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: CustomTheme.theme,
        debugShowCheckedModeBanner: dotenv.env['FLAVOR'] == 'dev',
      ),
    );
  }
}
