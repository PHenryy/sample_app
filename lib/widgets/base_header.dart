import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/paddings.dart';

class BaseHeader extends StatelessWidget {
  BaseHeader({
    this.title,
    this.height = 85,
    this.trailing,
    this.tailingIcon,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.withDivider = false,
  });

  final String title;
  final double height;
  final Widget trailing;
  final IconData tailingIcon;
  final Function onPressed;
  final Color backgroundColor;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    double _height = ScreenUtil().setWidth(height);

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: _height,
          child: Container(
            decoration: BoxDecoration(
              border: withDivider
                  ? Border(
                      bottom: BorderSide(
                        width: ScreenUtil().setWidth(1),
                        color: Color(0xFFD9D9D9),
                      ),
                    )
                  : null,
            ),
            margin: Paddings.fieldPadding,
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
        ),
      ),
    );
  }
}
