import 'package:flutter/material.dart';
import 'core/view_module_widget.dart';

class ViewModuleE extends StatelessWidget with ViewModuleWidget{
  const ViewModuleE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: const Center(
        child: Text('view_module_E'),
      ),
    );
  }
}
