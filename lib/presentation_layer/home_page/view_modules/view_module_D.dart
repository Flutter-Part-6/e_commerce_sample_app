import 'package:flutter/material.dart';
import 'core/view_module_widget.dart';

class ViewModuleD extends StatelessWidget with ViewModuleWidget {
  const ViewModuleD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.green,
      child: const Center(
        child: Text('view_module_D'),
      ),
    );
  }
}
