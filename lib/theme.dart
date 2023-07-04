import 'package:flutter/material.dart';

import 'theme/app_colors.dart';
import 'theme/custom_theme.dart';
import 'theme/typography.dart';

class CustomTheme {
  /// 44
  static final double appBarHeight = 44;

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        highlightColor: const Color(0xffae48d3),
        fontFamily: 'Pretendard',
        textTheme: customTextTheme,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primary,
        ),
        dividerTheme: DividerThemeData(color: AppColors.outline),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.inverseSurface,
          actionTextColor: AppColors.white,
          contentTextStyle:
              customTextTheme.titleSmall?.copyWith(color: AppColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          behavior: SnackBarBehavior.floating,
          insetPadding: const EdgeInsets.all(18),
          actionBackgroundColor: AppColors.inversePrimary,
        ),
        tabBarTheme: TabBarTheme(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: colorScheme.primary,
          labelStyle: customTextTheme.titleSmall.semiBold,
          unselectedLabelColor: colorScheme.contentSecondary,
          unselectedLabelStyle: customTextTheme.titleSmall,
          overlayColor: MaterialStatePropertyAll<Color>(
            Colors.grey[300] ?? Colors.grey,
          ),
        ),
      );
}
