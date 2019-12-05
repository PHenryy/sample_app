import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseListTile extends StatelessWidget {
  BaseListTile({this.title, this.height = 85, this.trailing});

  final String title;
  final double height;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    double _height = ScreenUtil().setWidth(height);

    return InkWell(
      onTap: () {},
      child: Container(
        height: _height,
        color: Colors.white,
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(23),
          right: ScreenUtil().setWidth(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(0xFF323232),
              ),
            ),
            trailing == null ? Container() : trailing,
          ],
        ),
      ),
    );
  }
}
