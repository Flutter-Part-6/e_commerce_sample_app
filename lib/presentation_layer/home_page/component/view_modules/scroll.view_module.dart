import 'package:flutter/material.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_padding.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_subtitle.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_title.dart';

import '../../../../../common/constants.dart';
import '../../../../../domain_layer/model/display/view_module/view_module.model.dart';
import 'common/img_slide_sample.dart';
import 'core/view_module_widget.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  const ScrollViewModule(this.info, {Key? key}) : super(key: key);
  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.verticalPadding,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
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
            // Image.network(info.products.first.imageUrl,height: 160,width: 125,),
          ],
        ),
      ),
    );
  }
}
