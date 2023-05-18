import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:sample_app/presentation_layer/common/bloc/bloc_test_observer.dart';
import 'package:sample_app/presentation_layer/common/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';

import 'injection_injectable.dart';
import 'presentation_layer/main_page.dart';

void main() async {
  // initDependencyInjection();
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = BlocTestObserver();
  KakaoSdk.init(
    nativeAppKey: '131a1167cce7a54b528d70f41dd7be0f',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => BottomNavigationCubit(), child: const MainPage()),
    );
  }
}
