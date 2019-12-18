import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/paddings.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/Gutter.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/scaffold_with_bottom_bar.dart';

class UserAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      title: '收货地址',
      body: <Widget>[
        Gutters.verticalGutter,
        Container(
          height: ScreenUtil().setWidth(120),
          color: Colors.white,
          padding: Paddings.fieldPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      color: Theme.of(context).accentColor,
                    ),
                    Gutter(
                      size: ScreenUtil().setWidth(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Text(
                              '小宝贝',
                              style: TextStyles.body1,
                            ),
                            Gutter(
                              size: ScreenUtil().setWidth(63),
                            ),
                            Text(
                              '12345678914',
                              style: TextStyles.body1,
                            ),
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(5),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(8),
                              ),
                              child: Text(
                                '默认',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Gutter(
                              size: ScreenUtil().setWidth(8),
                            ),
                            Text(
                              '河南省郑州市中原区',
                              style: TextStyles.body2sm,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.edit),
            ],
          ),
        ),
      ],
      footer: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: double.infinity,
        ),
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/user/address/edit');
          },
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          color: Theme.of(context).primaryColor,
          child: Text(
            '+ 新增地址',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
