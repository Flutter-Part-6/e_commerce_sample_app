import 'package:flutter/material.dart';
import 'package:sample_app/common/utils/extensions.dart';
import 'package:sample_app/domain_layer/model/display/view_module/view_module.model.dart';
import 'package:sample_app/presentation_layer/home_page/view_modules/core/view_module_widget.dart';
import 'package:sample_app/presentation_layer/home_page/view_modules/view_module_A.dart';
import 'package:sample_app/presentation_layer/home_page/view_modules/view_module_NONE.dart';

import '../view_module_B.dart';
import '../view_module_C.dart';
import '../view_module_D.dart';
import '../view_module_E.dart';

enum Modules {
  viewModuleA,
  viewModuleB,
  viewModuleC,
  viewModuleD,
  viewModuleE,
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
      case Modules.viewModuleA:
        return ViewModuleA(info);
      case Modules.viewModuleB:
        return ViewModuleB(info);
      case Modules.viewModuleC:
        return ViewModuleC(info);
      case Modules.viewModuleD:
        return ViewModuleD(info);
      case Modules.viewModuleE:
        return ViewModuleE(info);
    }
  }
}
