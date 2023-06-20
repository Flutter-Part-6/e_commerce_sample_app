import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringEx on String {
  String toSnakeCase() {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');

    return replaceAllMapped(exp, (Match m) => ('_${m.group(0)}')).toLowerCase();
  }

  bool get isSuccess => this == 'SUCCESS';
}

extension TextStyleEx on TextStyle {
  TextStyle titleCopyWith() {
    return copyWith(
      fontWeight: FontWeight.w300,
      height: 1.35,
    );
  }

  TextStyle discountRageCopyWith() {
    return copyWith(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
      height: 1.15,
    );
  }

  TextStyle priceCopyWith() {
    return copyWith(
      fontWeight: FontWeight.bold,
      height: 1.25,
    );
  }

  TextStyle originalPriceCopyWith() {
    return copyWith(
      fontWeight: FontWeight.w300,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
      height: 1.15,
    );
  }

  TextStyle reviewCountCopyWith() {
    return copyWith(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      height: 1.15,
    );
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
