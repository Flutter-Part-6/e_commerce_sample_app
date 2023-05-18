part of 'collections_bloc.dart';

abstract class CollectionsEvent {
  const CollectionsEvent();
}

class CollectionsInitialized extends CollectionsEvent {
  CollectionsInitialized({this.storeType});
  final StoreType? storeType;
}

class ToggledStoreTypes extends CollectionsEvent{
  ToggledStoreTypes(this.tabIndex);
  final int tabIndex;
}

class ChangedTab extends CollectionsEvent{
  ChangedTab(this.tabId);
  final int tabId;
}