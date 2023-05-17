import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';
import 'package:sample_app/domain_layer/usecase/place_holder/get_users.usecase.dart';

import '../../../../domain_layer/model/place_holder_sample/user/user.model.dart';

part 'user_event.dart';
part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final PlaceHolderUsecase _placeHolderUsecase;
  UserBloc(this._placeHolderUsecase) : super(UserState()) {
    on<UserInitialized>(_onUserIntialized);
  }

  Future<void> _onUserIntialized(
    UserInitialized event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final List<User> users = await _placeHolderUsecase.fetch(GetUsers());
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: Status.success, users: users));
    } catch (error) {
      emit(state.copyWith(status: Status.initial));
      log('[error] $error');
    }
  }
}
