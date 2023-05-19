import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.dto.freezed.dart';

part 'product_info.dto.g.dart';

@freezed
class ProductInfoDto with _$ProductInfoDto {
  const factory ProductInfoDto({
    @Default('') String? title,
    @Default('') String? imageUrl,
  }) = _ProductInfoDto;

  factory ProductInfoDto.fromJson(Map<String, Object?> json) =>
      _$ProductInfoDtoFromJson(json);
}
