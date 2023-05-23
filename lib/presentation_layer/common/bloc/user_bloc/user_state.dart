part of 'user_bloc.dart';

enum Status { initial, loading, success, error }

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(Status.initial) Status status,
    User? user,
  }) = _UserState;
}
