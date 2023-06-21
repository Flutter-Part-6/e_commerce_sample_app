import 'package:flutter/material.dart';

import 'app_colors.dart';

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  primaryContainer: AppColors.primaryContainer,
  secondary: AppColors.secondary,
  onSecondary: AppColors.onSecondary,
  error: AppColors.error,
  onError: AppColors.onError,
  background: AppColors.background,
  onBackground: AppColors.onBackground,
  surface: AppColors.surface,
  onSurface: AppColors.onSurface,
  surfaceVariant: AppColors.surfaceVariant,
  onSurfaceVariant: AppColors.onSurfaceVariant,
  outline: AppColors.outline,
  shadow: AppColors.shadow,
  inverseSurface: AppColors.inverseSurface,
  onInverseSurface: AppColors.onInverseSurface,
  inversePrimary: AppColors.inversePrimary,
);

extension ColorSchemeEx on ColorScheme {
  Color get positive => AppColors.positive;

  Color get contentPrimary => AppColors.contentPrimary;

  Color get contentSecondary => AppColors.contentSecondary;

  Color get contentTertiary => AppColors.contentTertiary;

  Color get contentFourth => AppColors.contentFourth;
}
