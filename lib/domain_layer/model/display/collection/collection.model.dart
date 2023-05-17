import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection.model.freezed.dart';
part 'collection.model.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required int tabId,
    required String title,
  }) = _Collection;

  factory Collection.fromJson(Map<String, Object?> json) =>
      _$CollectionFromJson(json);
}
