import 'package:flutter/material.dart';

const Color _primary = Color(0xff5f0080);

class CustomTheme {
  static ThemeData get theme => ThemeData(
        highlightColor: const Color(0xffae48d3),
        primaryColor: _primary,
        appBarTheme: const AppBarTheme(backgroundColor: _primary),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: _primary),
        tabBarTheme: TabBarTheme(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: _primary,
              width: 2,
            ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: _primary,
          unselectedLabelColor: Colors.grey[600],
        ),
      );
}
