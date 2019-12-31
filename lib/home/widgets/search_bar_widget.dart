import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/widgets/base_gutters.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(24),
        vertical: ScreenUtil().setWidth(20),
      ),
      child: MaterialButton(
        elevation: 0,
        shape: StadiumBorder(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search,
              color: Color(0xFFCCCCCC),
              size: ScreenUtil().setWidth(36),
            ),
            Gutters.gutter,
            Text(
              '搜索',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Color(0xFFCCCCCC),
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/search');
        },
      ),
    );
  }
}
