import 'package:flutter/material.dart';

class ViewModuleA extends StatelessWidget {
  const ViewModuleA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
      child: const Center(
        child: Text('view_module_A'),
      ),
    );
  }
}
