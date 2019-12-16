import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dividers {
  static Divider paddedBoth = Divider(
    thickness: 1.0,
    height: 0.0,
    color: Color(0xFFEEEEEE),
    indent: ScreenUtil().setWidth(24),
    endIndent: ScreenUtil().setWidth(24),
  );
}
