import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/home_page_bloc.dart';

class BlocTestObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc.runtimeType.toString() == 'CollectionsBloc') {
      final current = (change.currentState as CollectionsState).status;
      final next = (change.nextState as CollectionsState).status;

      log('onChange -- ${bloc.runtimeType},'
          '$current -> $next');
    }else if(bloc.runtimeType.toString()=='ViewModulesBloc'){
      final current = (change.currentState as ViewModulesState).status;
      final next = (change.nextState as ViewModulesState).status;

      log('onChange -- ${bloc.runtimeType},'
          '$current -> $next');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}');
  }
}
