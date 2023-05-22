part of 'view_modules_bloc.dart';

@freezed
class ViewModulesState with _$ViewModulesState {
  factory ViewModulesState({
    @Default(ViewModulesStatus.initial) ViewModulesStatus status,
    @Default(StoreType.market) StoreType storeType,
    @Default(0) int tabId,
    @Default(1) int currentPage,
    @Default(false) bool endOfPage,
    @Default(<Widget>[]) List<Widget> viewModules,
  }) = _ViewModulesState;
}
