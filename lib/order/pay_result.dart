import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/widgets/base_header.dart';

class PayResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '支付成功',
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(158),
            color: Color(0xFFFFAE38),
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(
                    '订单支付成功',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(34),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(12),
                  ),
                  Text(
                    '您的包裹整装待发',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(20),
          ),
          Container(
            height: ScreenUtil().setWidth(162),
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_city),
                    SizedBox(
                      width: ScreenUtil().setWidth(30),
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          '收货人：张',
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Text(
                          '联系电话：13141314131   ',
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Text(
                          '河南省郑州市中原区',
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(20),
          ),
          // 实付金额
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                '实付金额',
                style: TextStyles.body2,
              ),
              trailing: Text(
                '￥181.00',
                style: TextStyles.body4,
              ),
            ),
          ),
          // 操作
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(42),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: ScreenUtil().setWidth(295),
                    minHeight: ScreenUtil().setWidth(80),
                  ),
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Color(0xFFDFDFDF),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      '订单详情',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(80),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: ScreenUtil().setWidth(295),
                    minHeight: ScreenUtil().setWidth(80),
                  ),
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Color(0xFFDFDFDF),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/orderDetail');
                    },
                    child: Text(
                      '订单详情',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: ScreenUtil().setSp(30),
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
  }
}
