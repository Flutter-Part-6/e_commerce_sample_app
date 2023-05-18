part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserInitialized extends UserEvent {}

class UserLogout extends UserEvent {}
