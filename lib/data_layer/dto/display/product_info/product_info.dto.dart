import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.dto.freezed.dart';

part 'product_info.dto.g.dart';

@freezed
class ProductInfoDto with _$ProductInfoDto {
  const factory ProductInfoDto({
    @Default('') String? productId,
    @Default('') String? title,
    @Default('') String? subtitle,
    @Default(-1) int? price,
    @Default(-1) int? originalPrice,
    @Default(-1) int? discountRate,
    @Default(-1) int? reviewCount,
    @Default('') String? imageUrl,
  }) = _ProductInfoDto;

  factory ProductInfoDto.fromJson(Map<String, Object?> json) =>
      _$ProductInfoDtoFromJson(json);
}
