import 'package:flutter/material.dart';
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
        return module.toWidget() as Widget;
      }
    }
    return const ViewModuleNone();
  }
}

extension ModulesEx on Modules {
  ViewModuleWidget toWidget() {
    switch (this) {
      case Modules.viewModuleA:
        return const ViewModuleA();
      case Modules.viewModuleB:
        return const ViewModuleB();
      case Modules.viewModuleC:
        return const ViewModuleC();
      case Modules.viewModuleD:
        return const ViewModuleD();
      case Modules.viewModuleE:
        return const ViewModuleE();
    }
  }
}

extension StringEx on String {
  String toSnakeCase() {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    String result =
        replaceAllMapped(exp, (Match m) => ('_${m.group(0)}')).toLowerCase();

    return result;
  }
}
