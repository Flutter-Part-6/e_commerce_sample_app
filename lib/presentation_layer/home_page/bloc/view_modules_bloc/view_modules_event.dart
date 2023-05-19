part of 'view_modules_bloc.dart';

abstract class ViewModulesEvent {
  const ViewModulesEvent();
}

class ViewModulesInitialized extends ViewModulesEvent {
  ViewModulesInitialized({required this.storeType, required this.tabId});

  final StoreType storeType;
  final int tabId;
}

class ViewModulesFetched extends ViewModulesEvent {
  ViewModulesFetched();
}
