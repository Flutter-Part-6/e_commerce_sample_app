import 'package:flutter/material.dart';

import '../../../../../common/constants.dart';
import '../../../../../domain_layer/model/display/view_module/view_module.model.dart';
import 'core/view_module_widget.dart';
import 'widget/img_slide_sample.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_subtitle.dart';
import 'widget/view_module_title.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  const ScrollViewModule(this.info, {Key? key}) : super(key: key);
  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.verticalPadding,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewModulePadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewModuleTitle(title: info.title),
                  if (info.subtitle.isNotEmpty)
                    ViewModuleSubtitle(subtitle: info.subtitle),
                ],
              ),
            ),
            ImgSlide(info.products),
          ],
        ),
      ),
    );
  }
}
