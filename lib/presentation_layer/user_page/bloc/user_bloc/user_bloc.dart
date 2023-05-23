import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/domain_layer/usecase/user.usecase.dart';

import '../../../../domain_layer/usecase/user/user.usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _userUsecase;

  UserBloc(this._userUsecase) : super(UserState()) {
    on<UserLogin>(_onUserLogin);
    on<UserLogout>(_onUserLogout);
  }

  Future<void> _onUserLogin(
    UserLogin event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final (user, error) =
          await _userUsecase.fetch<(User, dynamic)>(GetUsers());
      emit(state.copyWith(status: Status.success, user: user));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
      log('[error] $error');
    }
  }

  Future<void> _onUserLogout(
    UserLogout event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _userUsecase.fetch(LogoutUser());
      emit(state.copyWith(status: Status.initial, user: null));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
      log('[error] $error');
    }
  }
}
