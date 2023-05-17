import 'package:flutter/material.dart';
import 'core/view_module_widget.dart';

class ViewModuleB extends StatelessWidget with ViewModuleWidget{
  const ViewModuleB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.orange,
      child: const Center(
        child: Text('view_module_B'),
      ),
    );
  }
}
