import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/dividers.dart';
import 'package:sample_app/widgets/base_buttons.dart';
import 'package:sample_app/widgets/base_fields.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/base_header.dart';
import 'package:sample_app/widgets/base_list_tile.dart';
import 'package:sample_app/widgets/scaffold_with_bottom_bar.dart';

class OrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      title: '订单详情',
      body: <Widget>[
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
        Gutters.verticalGutter,
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
        Gutters.verticalGutter,
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
            ],
          ),
        ),
        Gutters.verticalGutter,
        Container(
          child: Column(
            children: <Widget>[
              BaseField(
                title: '商品小计',
                content: '￥180.00',
              ),
              BaseField(
                title: '运费',
                content: '￥0.00',
              ),
              BaseField(
                title: '会员优惠',
                content: '￥9.00',
              ),
              BaseField(
                title: '实付款（含运费）',
                content: '￥179.00',
                contentStyle: TextStyle(
                  color: Color(0xFFFF5454),
                ),
              ),
            ],
          ),
        ),
        Gutters.verticalGutter,
        Container(
          child: Column(
            children: <Widget>[
              BaseField(
                title: '订单编号',
                subtitle: 'SH20191100123145685214',
              ),
              BaseField(
                title: '创建时间',
                subtitle: '2019-11-26  10:03:11',
              ),
              BaseField(
                title: '支付时间',
                subtitle: '2019-11-26  10:03:11',
              ),
            ],
          ),
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BaseOutlineButton(
            text: '申请退款',
            color: Color(0xFF666666),
            onPressed: () {
              Navigator.of(context).pushNamed('/orderRefund');
            },
          ),
        ],
      ),
    );
  }
}
