import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/data_layer/dto/display/product_info/product_info.dto.dart';

part 'view_module.dto.freezed.dart';

part 'view_module.dto.g.dart';

@freezed
class ViewModuleDto with _$ViewModuleDto {
  const factory ViewModuleDto({
    @Default('') String? type,
    @Default('') String? title,
    @Default('') String? subtitle,
    @Default(-1) int? time,
    @Default(<ProductInfoDto>[]) List<ProductInfoDto>? products,
  }) = _ViewModuleDto;

  factory ViewModuleDto.fromJson(Map<String, Object?> json) =>
      _$ViewModuleDtoFromJson(json);
}
