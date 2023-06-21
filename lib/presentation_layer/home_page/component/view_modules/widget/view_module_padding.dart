import 'package:flutter/material.dart';

import '../../../../../common/constants.dart';

class ViewModulePadding extends StatelessWidget {
  final Widget child;

  const ViewModulePadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.horizontalPadding.add(Constants.verticalPadding),
      child: child,
    );
  }
}
