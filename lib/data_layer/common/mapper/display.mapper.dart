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
      subtitle: subtitle ?? '',
      imageUrl: imageUrl ?? '',
      time: time ?? -1,
      products: products?.map((dto) => dto.toModel()).toList() ?? [],
      tabs: tabs ?? [],
    );
  }
}

/// ENTITY -> MODEL
extension ViewModuleEntityEx on ViewModuleEntity {
  ViewModule toModel() {
    return ViewModule(
      type: type,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      time: time,
      products: products.map((entity) => entity.toModel()).toList(),
      tabs: tabs,
    );
  }
}

/// MODEL -> ENTITY
extension ViewModuleEx on ViewModule {
  ViewModuleEntity toEntity() {
    return ViewModuleEntity(
      type: type,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      products: products.map((model) => model.toEntity()).toList(),
      time: time,
      tabs: tabs,
    );
  }
}

/// DTO -> MODEL
extension ProductInfoDtoEx on ProductInfoDto {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId ?? '',
      title: title ?? '',
      imageUrl: imageUrl ?? '',
      subtitle: subtitle ?? '',
      price: price ?? -1,
      originalPrice: originalPrice ?? -1,
      discountRate: discountRate ?? -1,
      reviewCount: reviewCount ?? -1,
    );
  }
}

/// MODEL -> ENTITY
extension ProductInfoEx on ProductInfo {
  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
      productId: productId,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

/// Entity -> MODEL
extension ProductInfoEntityEx on ProductInfoEntity {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId,
      title: title,
      imageUrl: imageUrl,
      subtitle: subtitle,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

/// Entity -> MODEL
extension CartEntityEx on CartEntity {
  Cart toModel() {
    return Cart(quantity: quantity, product: product.toModel());
  }
}

extension CartEx on Cart {
  CartEntity toEntity() {
    return CartEntity(product: product.toEntity(), quantity: quantity);
  }
}
