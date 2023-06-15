import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/data_layer/entity/display/data_source/data_source.entity.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';

import 'package:sample_app/presentation_layer/common/bloc/bloc_test_observer.dart';
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart';
import 'package:sample_app/presentation_layer/router.dart';
import 'package:sample_app/theme.dart';

import 'common/dependency_injection/injection_injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive 등록
  await Hive.initFlutter();
  await Hive.openBox('settings');

  Hive.registerAdapter(DataSourceEntityAdapter());
  Hive.registerAdapter(ViewModuleEntityAdapter());
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
  await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
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
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// class Controller {
//   void run() {
//     int i1 = 0;
//     int i2 = 1;
//     String s = "s";
//
//     A a = A();
//     B b = B();
//
//     var controll = [a, b];
//
//     for (dynamic value in controll) {
//       value.ok(i1, i2, s);
//       value.ok(s);
//     }
//   }
// }

// class Param {}
//
// class ParamA extends Param {
//   int i1 = 0;
// }
//
// class ParamB extends Param {
//   int i1 = 0;
//   int i2 = 1;
//   String s = "s";
// }
//
// abstract class Interface {
//   void ok();
// }
//
// class A extends Interface {
//   void ok(ParamA param) {
//     // param.i1;
//     // print(param.);
//   }
// }
//
// class B extends Interface {
//   void ok(Param param) {
//     print('$i1, $i2, $s');
//   }
// }
