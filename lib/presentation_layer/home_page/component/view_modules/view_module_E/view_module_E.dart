import 'package:flutter/material.dart';
import '../../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../common/img_slide_sample.dart';
import '../core/view_module_widget.dart';

class ViewModuleE extends StatelessWidget with ViewModuleWidget {
  const ViewModuleE(this.info, {Key? key}) : super(key: key);
  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('view_module_E'),
            Text(info.title),
            ImgSlide(info.products),
          ],
        ),
      ),
    );
  }
}
