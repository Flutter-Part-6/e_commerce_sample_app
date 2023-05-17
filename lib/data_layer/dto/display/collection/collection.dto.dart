import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection.dto.freezed.dart';

part 'collection.dto.g.dart';

@freezed
class CollectionDto with _$CollectionDto {
  const factory CollectionDto({
    @Default(0) int? tabId,
    @Default('') String? title,
  }) = _CollectionDto;

  factory CollectionDto.fromJson(Map<String, Object?> json) =>
      _$CollectionDtoFromJson(json);
}
