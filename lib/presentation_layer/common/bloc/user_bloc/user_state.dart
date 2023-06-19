part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(Status.initial) Status status,
    User? user,
  }) = _UserState;
}
