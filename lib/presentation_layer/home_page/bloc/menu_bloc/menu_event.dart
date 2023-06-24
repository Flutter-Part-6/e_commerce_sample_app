part of 'menu_bloc.dart';

abstract class MenuEvent {
  const MenuEvent();
}

class MenuInitialized extends MenuEvent {
  final MallType? mallType;

  MenuInitialized({this.mallType});
}

class ToggledMallTypes extends MenuEvent {
  final int tabIndex;

  ToggledMallTypes(this.tabIndex);
}

class ChangedTab extends MenuEvent {
  final int tabId;

  ChangedTab(this.tabId);
}
