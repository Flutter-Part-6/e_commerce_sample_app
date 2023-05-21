import 'package:flutter/material.dart';
import '../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../component/img_slide_sample.dart';
import 'core/view_module_widget.dart';

class ViewModuleA extends StatelessWidget with ViewModuleWidget {
  const ViewModuleA(this.info, {Key? key}) : super(key: key);
  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('view_module_A'),
            Text(info.title),
            ImgSlide(info.products),
            // Image.network(info.products.first.imageUrl,height: 160,width: 125,),
          ],
        ),
      ),
    );
  }
}
