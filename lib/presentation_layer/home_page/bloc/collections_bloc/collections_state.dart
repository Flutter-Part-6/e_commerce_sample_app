part of 'collections_bloc.dart';

@freezed
class CollectionsState with _$CollectionsState {
  factory CollectionsState({
    @Default(CollectionsStatus.initial) CollectionsStatus status,
    @Default(StoreType.market) StoreType storeType,
    @Default(<Collection>[]) List<Collection> collections,
  }) = _CollectionsState;
}
