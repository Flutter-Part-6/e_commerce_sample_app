part of 'collections_bloc.dart';

abstract class CollectionsEvent {
  const CollectionsEvent();
}

class CollectionsInitialized extends CollectionsEvent {
  final StoreType? storeType;

  CollectionsInitialized({this.storeType});
}

class ToggledStoreTypes extends CollectionsEvent {
  final int tabIndex;

  ToggledStoreTypes(this.tabIndex);
}

class ChangedTab extends CollectionsEvent {
  final int tabId;

  ChangedTab(this.tabId);
}
