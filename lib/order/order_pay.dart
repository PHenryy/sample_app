import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    padding: EdgeInsets.only(
                      bottom: ScreenUtil().setWidth(150),
                    ),
                    child: Column(
                      children: <Widget>[
                        BaseHeader(
                          title: '媓钻官方商城',
                          height: 70,
                          tailingIcon: Icons.shop,
                        ),
                        Divider(
                          thickness: 0.0,
                          height: 0.0,
                          indent: ScreenUtil().setWidth(24),
                          endIndent: ScreenUtil().setWidth(24),
                        ),
                        BaseListTile(
                          title: '媓钻之恋 甘草精华液',
                          subtitle: '10ml*2支',
                          text: '￥180',
                          subtext: '×3',
                        ),
                        Divider(
                          thickness: 0.0,
                          height: 0.0,
                          indent: ScreenUtil().setWidth(24),
                          endIndent: ScreenUtil().setWidth(24),
                        ),
                        BaseListTile(
                          title: '媓钻之恋 甘草精华液',
                          subtitle: '10ml*2支',
                          text: '￥180',
                          subtext: '×3',
                        ),
                        Divider(
                          thickness: 0.0,
                          height: 0.0,
                          indent: ScreenUtil().setWidth(24),
                          endIndent: ScreenUtil().setWidth(24),
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
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            height: ScreenUtil().setWidth(100),
          )
        ],
      ),
    );
  }
}
