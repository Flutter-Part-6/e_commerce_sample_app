import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.dto.freezed.dart';

part 'menu.dto.g.dart';

@freezed
class MenuDto with _$MenuDto {
  const factory MenuDto({
    @Default(0) int? tabId,
    @Default('') String? title,
  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, Object?> json) =>
      _$MenuDtoFromJson(json);
}
