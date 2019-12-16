import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseHeader extends StatelessWidget {
  BaseHeader({
    this.title,
    this.height = 85,
    this.trailing,
    this.tailingIcon,
    this.onPressed,
  });

  final String title;
  final double height;
  final Widget trailing;
  final IconData tailingIcon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double _height = ScreenUtil().setWidth(height);

    return InkWell(
      onTap: onPressed,
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
            Wrap(
              children: <Widget>[
                tailingIcon == null
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(8),
                        ),
                        child: Icon(tailingIcon),
                      ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: Color(0xFF323232),
                  ),
                ),
              ],
            ),
            trailing == null ? Container() : trailing,
          ],
        ),
      ),
    );
  }
}
