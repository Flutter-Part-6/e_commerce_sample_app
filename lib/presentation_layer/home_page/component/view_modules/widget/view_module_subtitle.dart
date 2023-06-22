import 'package:flutter/material.dart';

import '../../../../../theme/custom_theme.dart';
import '../../../../../theme/typography.dart';

class ViewModuleSubtitle extends StatelessWidget {
  final String subtitle;

  const ViewModuleSubtitle({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(
              color: colorScheme.contentTertiary,
            )
            .regular,
      ),
    );
  }
}
