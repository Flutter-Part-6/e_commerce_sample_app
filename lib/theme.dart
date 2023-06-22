import 'package:flutter/material.dart';
import 'package:sample_app/theme/app_colors.dart';

import 'theme/custom_theme.dart';
import 'theme/typography.dart';

class CustomTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        fontFamily: 'Pretendard',
        textTheme: customTextTheme,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primary,
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
          overlayColor:
              MaterialStatePropertyAll<Color>(Colors.grey[300] ?? Colors.grey),
        ),
      );
}
