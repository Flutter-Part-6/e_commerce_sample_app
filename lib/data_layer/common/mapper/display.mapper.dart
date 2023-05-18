import 'package:sample_app/data_layer/dto/display.dto.dart';
import 'package:sample_app/data_layer/entity/display/display.entity.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';

extension CollectionEx on CollectionDto {
  Collection toModel() {
    return Collection(
      tabId: tabId ?? 0,
      title: title ?? '',
    );
  }
}

/// DTO -> MODEL
extension ViewModuleDtoEx on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(
      type: type ?? '',
      title: title ?? '',
    );
  }
}

/// ENTITY -> MODEL
extension ViewModuleEntityEx on ViewModuleEntity {
  ViewModule toModel() {
    return ViewModule(
      type: type ?? '',
      title: title ?? '',
    );
  }
}

/// MODEL -> ENTITY
extension ViewModuleEx on ViewModule {
  ViewModuleEntity toEntity() {
    return ViewModuleEntity(
      type: type ?? '',
      title: title ?? '',
    );
  }
}
