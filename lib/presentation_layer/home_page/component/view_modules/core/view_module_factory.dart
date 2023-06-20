import 'package:flutter/material.dart';
import 'package:sample_app/common/utils/extensions.dart';
import 'package:sample_app/domain_layer/model/display/view_module/view_module.model.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/banner.view_module.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/brand_product.view_module.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/carousel.view_module.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/category_product.view_module.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/scroll.view_module.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/special_price.view_module.dart';

import '../widget/view_module_NONE.dart';
import 'view_module_widget.dart';

enum Modules {
  carouselViewModule,
  specialPriceViewModule,
  categoryProductViewModule,
  bannerViewModule,
  brandProductViewModule,
  scrollViewModule,
}

class ViewModuleFactory {
  Widget textToWidget(ViewModule viewModule) {
    final String type = viewModule.type.toSnakeCase();
    for (final module in Modules.values) {
      final name = module.name.toSnakeCase();
      if (name.contains(type)) {
        return module.toWidget(viewModule) as Widget;
      }
    }

    return const ViewModuleNone();
  }
}

extension ModulesEx on Modules {
  ViewModuleWidget toWidget(ViewModule info) {
    switch (this) {
      case Modules.categoryProductViewModule:
        return CategoryProductViewModule(info);
      case Modules.carouselViewModule:
        return CarouselViewModule(info);
      case Modules.specialPriceViewModule:
        return SpecialPriceViewModule(info);
      case Modules.bannerViewModule:
        return BannerViewModule(info);
      case Modules.brandProductViewModule:
        return BrandProductViewModule(info);
      case Modules.scrollViewModule:
        return ScrollViewModule(info);
    }
  }
}
