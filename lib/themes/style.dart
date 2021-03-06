import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF34BBE7),
    accentColor: Color(0xFFFF5454),
    scaffoldBackgroundColor: Color(0xFFF9F9F8),
    textTheme: TextTheme(
      body1: TextStyle(
        color: Color(0xFF666666),
      ),
      subhead: TextStyle(
        color: Color(0xFF323232),
      ),
      subtitle: TextStyle(
        color: Color(0xFF666666),
      ),
    ),
    dividerColor: Color(0xFFD9D9D9),
  );
}
