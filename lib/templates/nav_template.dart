import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/models/nav.dart';

class NavTemplate extends StatelessWidget {
  const NavTemplate({
    Key key,
    this.nav,
  }) : super(key: key);

  final Nav nav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(nav.routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            nav.icon,
            size: ScreenUtil().setWidth(48),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(15.0),
          ),
          Text(
            nav.label,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(22.0),
            ),
          )
        ],
      ),
    );
  }
}
