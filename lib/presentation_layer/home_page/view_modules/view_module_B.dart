import 'package:flutter/material.dart';

class ViewModuleB extends StatelessWidget {
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
