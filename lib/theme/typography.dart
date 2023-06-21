import 'package:flutter/material.dart';
import 'app_colors.dart';

const String pretendard = 'Pretendard';

extension fontWeight on FontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

extension TextStyleX on TextStyle? {
  TextStyle? get semiBold => this?.copyWith(fontWeight: fontWeight.semiBold);

  TextStyle? get bold => this?.copyWith(fontWeight: fontWeight.semiBold);
}

const customTextTheme = TextTheme(
  // display
  displayLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 57,
    height: 68 / 57,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 45,
    height: 54 / 45,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 36,
    height: 45 / 36,
    letterSpacing: -0.35,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  //head_line
  headlineLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 32,
    height: 40 / 32,
    fontWeight: fontWeight.semiBold,
    color: AppColors.black,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 22,
    height: 28 / 22,
    fontWeight: fontWeight.semiBold,
    color: AppColors.black,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20,
    height: 25 / 20,
    letterSpacing: -0.35,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  //title --> title_semibold => copywith
  titleLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 18,
    height: 23 / 18,
    letterSpacing: -0.35,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    height: 20 / 16,
    letterSpacing: 0.1,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    height: 18 / 14,
    letterSpacing: 0.12,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 13,
    height: 16 / 13,
    letterSpacing: 0.5,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    height: 15 / 12,
    letterSpacing: 0.25,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 11,
    height: 15 / 11,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.5,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    height: 21 / 14,
    letterSpacing: 0.25,
    fontWeight: fontWeight.regular,
    color: AppColors.black,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    height: 18 / 12,
    fontWeight: fontWeight.regular,
    letterSpacing: 0.4,
    color: AppColors.black,
  ),
);
