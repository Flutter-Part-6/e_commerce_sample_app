import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.model.freezed.dart';

part 'product_info.model.g.dart';

@freezed
class ProductInfo with _$ProductInfo {
  const factory ProductInfo({
    required String title,
    required String imageUrl,
    required String subtitle,
    required int price,
  }) = _ProductInfo;

  factory ProductInfo.fromJson(Map<String, Object?> json) =>
      _$ProductInfoFromJson(json);
}
