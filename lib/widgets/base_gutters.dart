import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gutters {
  static Widget gutter = SizedBox(
    width: ScreenUtil().setWidth(16),
  );
  static Widget verticalGutter = SizedBox(
    height: ScreenUtil().setWidth(20),
  );
}
