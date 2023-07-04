import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.dto.freezed.dart';

part 'sample.dto.g.dart';

@freezed
class SampleDto with _$SampleDto {
  const factory SampleDto({
    @Default('') String aa,
  }) = _SampleDto;

  factory SampleDto.fromJson(Map<String, dynamic> json) =>
      _$SampleDtoFromJson(json);
}
