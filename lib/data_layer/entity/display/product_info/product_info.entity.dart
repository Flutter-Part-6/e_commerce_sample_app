import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.entity.freezed.dart';
part 'product_info.entity.g.dart';

@freezed
class ProductInfoEntity with _$ProductInfoEntity {
  const factory ProductInfoEntity({
    required String title,
    required String imageUrl,
  }) = _ProductInfoEntity;

  factory ProductInfoEntity.fromJson(Map<String, Object?> json) =>
      _$ProductInfoEntityFromJson(json);
}
