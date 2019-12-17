import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/dividers.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/widgets/base_header.dart';
import 'package:sample_app/widgets/base_list_tile.dart';
import 'package:sample_app/widgets/text_field_item.dart';

class OrderPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '确认订单',
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setWidth(160),
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
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '收货人：张',
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(50),
                                    ),
                                    Text(
                                      '11111111111',
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenUtil().setWidth(10),
                                ),
                                Text(
                                  '河南省郑州市中原区',
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(20),
                  ),
                  Container(
                    color: Colors.white,
                    // padding: EdgeInsets.only(
                    //   bottom: ScreenUtil().setWidth(150),
                    // ),
                    child: Column(
                      children: <Widget>[
                        BaseHeader(
                          title: '媓钻官方商城',
                          height: 70,
                          tailingIcon: Icons.shop,
                        ),
                        Dividers.paddedBoth,
                        BaseListTile(
                          title: '媓钻之恋 甘草精华液',
                          subtitle: '10ml*2支',
                          text: '￥180',
                          subtext: '×3',
                        ),
                        Dividers.paddedBoth,
                        BaseListTile(
                          title: '媓钻之恋 甘草精华液',
                          subtitle: '10ml*2支',
                          text: '￥180',
                          subtext: '×3',
                        ),
                        Dividers.paddedBoth,
                      ],
                    ),
                  ),
                  BaseHeader(
                    title: '',
                    trailing: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text(
                          '共',
                          style: TextStyles.body1sm,
                        ),
                        Text(
                          '1',
                          style: TextStyles.body1sm,
                        ),
                        Text(
                          '件商品 共计：',
                          style: TextStyles.body1sm,
                        ),
                        Text(
                          '￥180',
                          style: TextStyles.body1sm,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        // horizontal: ScreenUtil().setWidth(24),
                        // vertical: ScreenUtil().setWidth(24),
                        ),
                    // height: ScreenUtil().setWidth(120),
                    color: Colors.white,
                    child: TextFieldItem(
                      title: "买家留言",
                      hintText: "50字以内(选填）",
                      maxLength: 50,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(20),
                  ),
                  BaseHeader(
                    title: '商品小计',
                    trailing: Text(
                      '￥180',
                      style: TextStyles.body1sm,
                    ),
                  ),
                  Dividers.paddedBoth,
                  BaseHeader(
                    title: '运费',
                    trailing: Text(
                      '￥180',
                      style: TextStyles.body1sm,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: ScreenUtil().setWidth(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '需付：',
                  style: TextStyles.body1sm,
                ),
                Text(
                  '￥180.00',
                  style: TextStyles.body1sm,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(22),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: double.infinity,
                    minWidth: ScreenUtil().setWidth(240),
                  ),
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/orderPayMethod');
                    },
                    child: Text(
                      '立即支付',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
