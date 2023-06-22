import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/custom_theme.dart';
import '../../theme/typography.dart';

extension StringEx on String {
  String toSnakeCase() {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');

    return replaceAllMapped(exp, (Match m) => ('_${m.group(0)}')).toLowerCase();
  }

  bool get isSuccess => this == 'SUCCESS';
}

extension TextStyleEx on TextStyle {
  TextStyle? titleCopyWith() {
    return copyWith(
      color: colorScheme.contentPrimary,
    ).regular;
  }

  TextStyle? discountRageCopyWith() {
    return copyWith(
      color: colorScheme.secondary,
    ).bold;
  }

  TextStyle? priceCopyWith() {
    return copyWith(
      color: colorScheme.contentPrimary,
    ).bold;
  }

  TextStyle? originalPriceCopyWith() {
    return copyWith(
      color: colorScheme.contentFourth,
      decoration: TextDecoration.lineThrough,
    ).regular;
  }

  TextStyle? reviewCountCopyWith() {
    return copyWith(
      color: colorScheme.contentTertiary,
    ).regular;
  }
}

// extensions
extension IntEx on int {
  String toWon() {
    final priceFormat = NumberFormat('###,###,###,###원');

    return priceFormat.format(this);
  }

  String toReview() {
    return this > 9999 ? '9999+' : toString();
  }
}
