import 'package:flutter/material.dart';
import '../../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../common/img_slide_sample.dart';
import '../core/view_module_widget.dart';

class ViewModuleB extends StatelessWidget with ViewModuleWidget {
  const ViewModuleB(this.info, {Key? key}) : super(key: key);
  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('view_module_B'),
            Text(info.title),
            ImgSlide(info.products),
          ],
        ),
      ),
    );
  }
}
