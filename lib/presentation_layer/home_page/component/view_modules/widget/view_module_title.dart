import 'package:flutter/material.dart';

import '../../../../../theme/typography.dart';

class ViewModuleTitle extends StatelessWidget {
  final String title;

  const ViewModuleTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge.semiBold,
    );
  }
}
