import 'package:flutter/material.dart';

class ViewModuleD extends StatelessWidget {
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
