// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductInfo _$$_ProductInfoFromJson(Map<String, dynamic> json) =>
    _$_ProductInfo(
      productId: json['productId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      subtitle: json['subtitle'] as String,
      price: json['price'] as int,
      originalPrice: json['originalPrice'] as int,
      discountRate: json['discountRate'] as int,
      reviewCount: json['reviewCount'] as int,
    );

Map<String, dynamic> _$$_ProductInfoToJson(_$_ProductInfo instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'discountRate': instance.discountRate,
      'reviewCount': instance.reviewCount,
    };
