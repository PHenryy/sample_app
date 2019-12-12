import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseListTile extends StatelessWidget {
  BaseListTile(
      {this.title, this.subtitle, this.text, this.subtext, this.onPressed});

  final String title;
  final String subtitle;
  final String text;
  final String subtext;
  // final double height;
  // final Widget trailing;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    // double _height = ScreenUtil().setWidth(height);

    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: _height,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(24),
          vertical: ScreenUtil().setWidth(24),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/i2.jpg',
              width: ScreenUtil().setWidth(161),
              height: ScreenUtil().setWidth(161),
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(24),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setWidth(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        text,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        subtext,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
