import 'package:flutter/material.dart';

class ViewModuleNone extends StatelessWidget {
  const ViewModuleNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      child: Center(
        child: Row(
          children: const [
            Text('view_module_NONE'),
            Icon(
              Icons.close,
              size: 20,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
