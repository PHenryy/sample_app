import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/dividers.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/base_alert_dialog.dart';
import 'package:sample_app/widgets/base_app_bar.dart';

class OrderPayMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '收银台',
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Material(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      '订单编号',
                      style: TextStyles.body2,
                    ),
                    trailing: Text(
                      'SH2019112608888888888888',
                      style: TextStyles.body1sm,
                    ),
                  ),
                  Dividers.paddedBoth,
                  ListTile(
                    title: Text(
                      '订单金额',
                      style: TextStyles.body2,
                    ),
                    trailing: Text(
                      '￥181.00',
                      style: TextStyles.body4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setWidth(20),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BaseAlertDialog(
                    title: Text("提醒"),
                    content: Text("确定您要取消申请吗？"),
                    onConfirm: () {
                      Navigator.of(context).pushNamed('/payResult');
                    },
                  );
                },
              );
            },
            child: Container(
              color: Colors.white,
              height: ScreenUtil().setWidth(130),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Icon(Icons.golf_course),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '微信支付',
                            style: TextStyles.body1,
                          ),
                          Wrap(
                            children: <Widget>[
                              Icon(Icons.sms_failed),
                              Text(
                                '微信安全支付',
                                style: TextStyles.body1sm,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
