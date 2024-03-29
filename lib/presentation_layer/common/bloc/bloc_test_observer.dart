import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/utils/logger.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/home_page_bloc.dart';

import '../../home_page/bloc/cart_bloc/cart_bloc.dart';
import '../../home_page/bloc/menu_bloc/menu_bloc.dart';

class BlocTestObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType},###${bloc.hashCode}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // CustomLogger.logger.e(
    //     'onChange -- ${bloc.runtimeType},###${bloc.hashCode},${change.currentState} -> ${change.nextState}');
    // if (bloc.runtimeType.toString() == 'MenuBloc') {
    //   // final current = (change.currentState as MenuState).status;
    //   // final next = (change.nextState as MenuState).status;
    //
    //   CustomLogger.logger.d(
    //       'onChange -- ${bloc.runtimeType},###${bloc.hashCode},${change.currentState} -> ${change.nextState}');
    // } else if (bloc.runtimeType.toString() == 'ViewModulesBloc') {
    //   final current = (change.currentState as ViewModulesState).status;
    //   final next = (change.nextState as ViewModulesState).status;
    //   CustomLogger.logger.d(
    //       'onChange -- ${bloc.runtimeType},###${bloc.hashCode},$current -> $next');
    //   // log('onChange -- ${bloc.runtimeType},###${bloc.hashCode},$current -> $next');
    // } else if (bloc.runtimeType.toString() == 'CartBloc') {
    //   final current = (change.currentState as CartState).status;
    //   final next = (change.nextState as CartState).status;
    //   // log('onChange -- ${bloc.runtimeType},###${bloc.hashCode},$current -> $next');
    // } else if (bloc.runtimeType.toString() == 'CartListBloc') {
    //   final current = (change.currentState as CartListState).status;
    //   final next = (change.nextState as CartListState).status;
    //   // CustomLogger.logger.d(
    //   //     'onChange -- ${bloc.runtimeType},###${bloc.hashCode},$current -> $next');
    // }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType},###${bloc.hashCode},');
  }
}
