import 'package:flutter/material.dart';

import '../core/view_module_widget.dart';

class ViewModuleNone extends StatelessWidget with ViewModuleWidget {
  const ViewModuleNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.close,
              size: 20,
              color: Colors.red,
            ),
            Text('view_module_NONE'),
          ],
        ),
      ),
    );
  }
}
