// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewModuleDto _$$_ViewModuleDtoFromJson(Map<String, dynamic> json) =>
    _$_ViewModuleDto(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      time: json['time'] as int? ?? -1,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductInfoDto>[],
    );

Map<String, dynamic> _$$_ViewModuleDtoToJson(_$_ViewModuleDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'time': instance.time,
      'products': instance.products,
    };
