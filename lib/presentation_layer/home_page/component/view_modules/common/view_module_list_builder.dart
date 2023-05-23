import 'package:flutter/material.dart';


//TODO 추후 교체되어야 함
class ViewModuleListBuilder extends StatelessWidget {
  const ViewModuleListBuilder({
    required this.color,
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}