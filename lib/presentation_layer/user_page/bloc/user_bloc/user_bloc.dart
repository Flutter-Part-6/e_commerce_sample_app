import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';
import 'package:sample_app/domain_layer/usecase/user/get_users.usecase.dart';
import 'package:sample_app/domain_layer/usecase/user/logout_user.usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final PlaceHolderUsecase _placeHolderUsecase;

  UserBloc(this._placeHolderUsecase) : super(UserState()) {
    on<UserInitialized>(_onUserInitialized);
    on<UserLogout>(_onUserLogout);
  }

  Future<void> _onUserInitialized(
    UserInitialized event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final User user = await _placeHolderUsecase.fetch<User>(GetUsers());
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: Status.success, user: user));
    } catch (error) {
      emit(state.copyWith(status: Status.initial));
      log('[error] $error');
    }
  }

  Future<void> _onUserLogout(
    UserLogout event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _placeHolderUsecase.fetch(LogoutUser());
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: Status.success));
    } catch (error) {
      emit(state.copyWith(status: Status.initial));
      log('[error] $error');
    }
  }
}