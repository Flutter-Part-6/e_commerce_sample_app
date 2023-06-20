import 'package:flutter/material.dart';

import '../core/view_module_widget.dart';

class ViewModuleNone extends StatelessWidget with ViewModuleWidget {
  const ViewModuleNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border.fromBorderSide(
          BorderSide(color: Colors.red, width: 2),
        ),
      ),
      height: 200,
      child: const Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.close, size: 20, color: Colors.red),
          Text('view_module_NONE'),
        ]),
      ),
    );
  }
}
