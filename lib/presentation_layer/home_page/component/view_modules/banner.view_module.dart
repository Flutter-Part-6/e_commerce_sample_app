import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import 'core/view_module_widget.dart';

class BannerViewModule extends StatelessWidget with ViewModuleWidget {
  const BannerViewModule(this.info, {Key? key}) : super(key: key);

  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return info.imageUrl.isNotEmpty
        ? AspectRatio(
            aspectRatio: 375 / 79,
            child: Image.network(
              info.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          )
        : const SizedBox.shrink();
  }
}
