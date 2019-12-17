import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseOutlineButton extends StatelessWidget {
  const BaseOutlineButton({
    Key key,
    this.text,
    this.color,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: ScreenUtil().setWidth(172),
        minHeight: ScreenUtil().setWidth(55),
        maxHeight: ScreenUtil().setWidth(55),
      ),
      child: OutlineButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtil().setWidth(28),
            color: color,
          ),
        ),
        disabledBorderColor: color,
        highlightColor: color,
        borderSide: BorderSide(
          color: color,
        ),
        shape: StadiumBorder(),
      ),
    );
  }
}
