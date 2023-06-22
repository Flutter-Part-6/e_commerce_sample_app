import 'package:flutter/material.dart';

import 'theme/custom_theme.dart';
import 'theme/typography.dart';

const Color _primary = Color(0xff5f0080);

class CustomTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        highlightColor: const Color(0xffae48d3),
        fontFamily: 'Pretendard',
        textTheme: customTextTheme,
        appBarTheme: const AppBarTheme(backgroundColor: _primary),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: _primary),
        tabBarTheme: TabBarTheme(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: _primary, width: 2),
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
