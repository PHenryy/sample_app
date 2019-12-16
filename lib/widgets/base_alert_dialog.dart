import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAlertDialog extends StatelessWidget {
  /// Creates an alert dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  ///
  /// The [contentPadding] must not be null. The [titlePadding] defaults to
  /// null, which implies a default that depends on the values of the other
  /// properties. See the documentation of [titlePadding] for details.
  const BaseAlertDialog({
    Key key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.backgroundColor,
    this.elevation,
    this.onConfirm,
  })  : assert(contentPadding != null),
        super(key: key);

  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle titleTextStyle;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle contentTextStyle;
  final Color backgroundColor;
  final double elevation;
  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (title != null)
            Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  color: Color(0xFF323232),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(30),
                    bottom: content != null ? 0 : ScreenUtil().setWidth(30),
                  ),
                  child: title,
                ),
              ),
            ),
          if (content != null)
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setWidth(30),
                  horizontal: ScreenUtil().setWidth(36),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: Color(0xFF888888),
                  ),
                  child: content,
                ),
              ),
            ),
          Container(
            height: ScreenUtil().setWidth(84),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: ScreenUtil().setWidth(1),
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: double.infinity,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '取消',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Color(0xFFD9D9D9),
                  width: ScreenUtil().setWidth(1),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: onConfirm,
                    child: Text(
                      '确认',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Dialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
      ),
      child: dialogChild,
    );
  }
}
