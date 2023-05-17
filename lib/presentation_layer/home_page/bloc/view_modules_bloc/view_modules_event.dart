part of 'view_modules_bloc.dart';

abstract class ViewModulesEvent {
  const ViewModulesEvent();
}

class ViewModulesInitialized extends ViewModulesEvent {
  ViewModulesInitialized({this.storeType,this.collections});
  final StoreType? storeType;
  final List<Collection>? collections;
}

class ViewModulesFetched extends ViewModulesEvent {
  ViewModulesFetched({required this.tabIndex});
  final int tabIndex;
}
