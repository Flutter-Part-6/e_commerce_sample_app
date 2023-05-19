import '../../dto/display.dto.dart';
import '../../../domain_layer/model/display.model.dart';
import '../../entity/display/display.entity.dart';

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
      products: products?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}

/// ENTITY -> MODEL
extension ViewModuleEntityEx on ViewModuleEntity {
  ViewModule toModel() {
    return ViewModule(
      type: type ?? '',
      title: title ?? '',
      products: products.map((entity) => entity.toModel()).toList(),
    );
  }
}

/// MODEL -> ENTITY
extension ViewModuleEx on ViewModule {
  ViewModuleEntity toEntity() {
    return ViewModuleEntity(
      type: type ?? '',
      title: title ?? '',
      products: products.map((model) => model.toEntity()).toList(),
    );
  }
}

/// DTO -> MODEL
extension ProductInfoDtoEx on ProductInfoDto {
  ProductInfo toModel() {
    return ProductInfo(
      title: title ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}

/// MODEL -> ENTITY
extension ProductInfoEx on ProductInfo {
  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
      imageUrl: imageUrl ?? '',
      title: title ?? '',
    );
  }
}

/// Entity -> MODEL
extension ProductInfoEntityEx on ProductInfoEntity {
  ProductInfo toModel() {
    return ProductInfo(
      imageUrl: imageUrl ?? '',
      title: title ?? '',
    );
  }
}
