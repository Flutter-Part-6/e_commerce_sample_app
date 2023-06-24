part of 'collections_bloc.dart';

@freezed
class CollectionsState with _$CollectionsState {
  factory CollectionsState({
    @Default(Status.initial) Status status,
    @Default('') String errorMsg,
    @Default(MallType.market) MallType mallType,
    @Default(0) int currentTabId,
    @Default(<Collection>[]) List<Collection> collections,
  }) = _CollectionsState;
}
