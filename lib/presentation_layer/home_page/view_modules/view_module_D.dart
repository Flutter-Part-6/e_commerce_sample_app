import 'package:flutter/material.dart';
import '../../../domain_layer/model/display/view_module/view_module.model.dart';
import 'core/view_module_widget.dart';

class ViewModuleD extends StatelessWidget with ViewModuleWidget {
  const ViewModuleD(this.info, {Key? key}) : super(key: key);
  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('view_module_D'),
            Text(info.title),
          ],
        ),
      ),
    );
  }
}
