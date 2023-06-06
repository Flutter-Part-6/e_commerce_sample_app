part of 'view_modules_bloc.dart';

abstract class ViewModulesEvent {
  const ViewModulesEvent();
}

class ViewModulesInitialized extends ViewModulesEvent {
  final StoreType storeType;
  final int tabId;
  final bool isRefresh;

  ViewModulesInitialized({
    required this.storeType,
    required this.tabId,
    this.isRefresh = false,
  });
}

class ViewModulesFetched extends ViewModulesEvent {
  ViewModulesFetched();
}
