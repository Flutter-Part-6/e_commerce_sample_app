import 'package:flutter/material.dart';

class ViewModuleSubtitle extends StatelessWidget {
  final String subtitle;

  const ViewModuleSubtitle({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
    );
  }
}
