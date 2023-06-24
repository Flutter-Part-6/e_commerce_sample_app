part of 'collections_bloc.dart';

abstract class CollectionsEvent {
  const CollectionsEvent();
}

class CollectionsInitialized extends CollectionsEvent {
  final MallType? mallType;

  CollectionsInitialized({this.mallType});
}

class ToggledMallTypes extends CollectionsEvent {
  final int tabIndex;

  ToggledMallTypes(this.tabIndex);
}

class ChangedTab extends CollectionsEvent {
  final int tabId;

  ChangedTab(this.tabId);
}
