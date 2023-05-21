// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductInfo _$$_ProductInfoFromJson(Map<String, dynamic> json) =>
    _$_ProductInfo(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      subtitle: json['subtitle'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$$_ProductInfoToJson(_$_ProductInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'subtitle': instance.subtitle,
      'price': instance.price,
    };
