import 'package:flutter/material.dart';

const Color _primary = Color(0xff5f0080);

class CustomTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: _primary,
        highlightColor: const Color(0xffae48d3),
        appBarTheme: const AppBarTheme(
          backgroundColor: _primary,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: _primary,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2,
              color: _primary,
            ),
          ),
          unselectedLabelColor: Colors.grey[600],
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: _primary,
        ),
      );
}
