// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductInfoDto _$$_ProductInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductInfoDto(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductInfoDtoToJson(_$_ProductInfoDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
