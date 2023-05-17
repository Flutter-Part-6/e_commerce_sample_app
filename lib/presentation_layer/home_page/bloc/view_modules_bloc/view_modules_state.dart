part of 'view_modules_bloc.dart';

@freezed
class ViewModulesState with _$ViewModulesState {
  factory ViewModulesState({
    @Default(StoreType.market) StoreType storeType,
    @Default(<Collection>[]) List<Collection> collections,
    @Default(<ViewModulesStatus>[ViewModulesStatus.initial]) List<ViewModulesStatus> status,
    @Default(<int,List<ViewModule>>{}) Map<int,List<ViewModule>> viewModules,
  }) = _ViewModulesState;
}
