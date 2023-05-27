import 'package:flutter/material.dart';

class ViewModulePadding extends StatelessWidget {
  final Widget child;

  const ViewModulePadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: child,
    );
  }
}
