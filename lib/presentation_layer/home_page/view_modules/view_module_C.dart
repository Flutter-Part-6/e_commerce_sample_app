import 'package:flutter/material.dart';

class ViewModuleC extends StatelessWidget {
  const ViewModuleC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.yellow,
      child: const Center(
        child: Text('view_module_C'),
      ),
    );
  }
}
