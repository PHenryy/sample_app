import 'package:flutter/material.dart';
import './themes/style.dart';
import './widgets/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: BottomNavation(),
    );
  }
}
