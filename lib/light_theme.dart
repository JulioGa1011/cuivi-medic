import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get themeData {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1C4980),
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1C4980),
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0x86222222),
        ),
      ),
    );
  }
}
