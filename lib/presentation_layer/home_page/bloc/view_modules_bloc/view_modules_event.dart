part of 'view_modules_bloc.dart';

abstract class ViewModulesEvent {
  const ViewModulesEvent();
}

class ViewModulesInitialized extends ViewModulesEvent {
  ViewModulesInitialized(
      {required this.storeType, required this.tabId, this.isRefresh = false});

  final StoreType storeType;
  final int tabId;
  final bool isRefresh;
}

class ViewModulesFetched extends ViewModulesEvent {
  ViewModulesFetched();
}
