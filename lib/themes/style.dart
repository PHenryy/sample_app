import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF34BBE7),
    scaffoldBackgroundColor: Color(0xFFF9F9F8),
    textTheme: TextTheme(
      subhead: TextStyle(
        color: Color(0xFF323232),
      ),
      subtitle: TextStyle(
        color: Color(0xFF666666),
      ),
    ),
  );
}
