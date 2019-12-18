import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/paddings.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/Gutter.dart';
import 'package:sample_app/widgets/base_buttons.dart';
import 'package:sample_app/widgets/base_fields.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/base_header.dart';
import 'package:sample_app/widgets/scaffold_with_bottom_bar.dart';

class OrderRefundResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      title: '退款申请',
      body: <Widget>[
        Gutters.verticalGutter,
        RefundStatusB(),
        Gutters.verticalGutter,
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseHeader(
                tailingIcon: Icons.location_on,
                title: '退款地址',
                withDivider: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(24),
                  vertical: ScreenUtil().setWidth(36),
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    Text(
                      '男生郑州市中原区 西三环电厂路大学科技园东区11号楼1408',
                      style: TextStyles.body2xs,
                    ),
                    Text(
                      '媓钻111111111111111111',
                      style: TextStyles.body2xs,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gutters.verticalGutter,
        BaseField(
          title: '退货状态',
          content: '需填写快递单号',
          trailingIcon: Icons.chevron_right,
          onPressed: () {
            Navigator.of(context).pushNamed('/trackingNumber');
          },
        ),
        BaseHeader(
          title: '协商详情',
          backgroundColor: Colors.transparent,
        ),
        BaseField(
          title: '处理方式',
          content: '退款',
          withDivider: true,
        ),
        BaseField(
          title: '退款原因',
          content: '不想要了',
          withDivider: true,
        ),
        BaseField(
          title: '退款说明',
          content: '无',
          withDivider: true,
        ),
        BaseField(
          title: '退款金额',
          content: '￥179.00',
          withDivider: true,
        ),
        BaseField(
          title: '申请时间',
          content: '2019-11-26 14:12',
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BaseOutlineButton(
            text: '提交申请',
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pushNamed('/orderRefundResult');
            },
          ),
          Gutters.gutter,
          BaseOutlineButton(
            text: '取消',
            color: Color(0xFF666666),
          ),
        ],
      ),
    );
  }
}

class RefundStatusA extends StatelessWidget {
  const RefundStatusA({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.fieldPadding,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gutter(
            size: ScreenUtil().setWidth(31),
            direction: Axis.vertical,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '等待商家处理退款申请',
                style: TextStyles.body1xl,
              ),
              Icon(Icons.chevron_right),
            ],
          ),
          Gutter(
            size: ScreenUtil().setWidth(46),
            direction: Axis.vertical,
          ),
          Text(
            '退款申请流程：',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(10),
            direction: Axis.vertical,
          ),
          Text(
            '1、发起退款申请',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(10),
            direction: Axis.vertical,
          ),
          Text(
            '2、商家确认后退款到您的账户 如果商家未处理： 请及时与商家联系',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(38),
            direction: Axis.vertical,
          ),
        ],
      ),
    );
  }
}

class RefundStatusB extends StatelessWidget {
  const RefundStatusB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.fieldPadding,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gutter(
            size: ScreenUtil().setWidth(31),
            direction: Axis.vertical,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '商家已经通过售后申请',
                style: TextStyles.body1xl,
              ),
              Icon(Icons.chevron_right),
            ],
          ),
          Gutter(
            size: ScreenUtil().setWidth(46),
            direction: Axis.vertical,
          ),
          Text(
            '退款退货申请流程：',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(10),
            direction: Axis.vertical,
          ),
          Text(
            '1、发起退款退货申请',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(10),
            direction: Axis.vertical,
          ),
          Text(
            '2、退货需将退货商品邮寄至商家指定地址，并在系统内输入快递单号',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(10),
            direction: Axis.vertical,
          ),
          Text(
            '3、商家收货后确认无误',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(10),
            direction: Axis.vertical,
          ),
          Text(
            '4、退款到您的账户',
            style: TextStyles.body3sm,
          ),
          Gutter(
            size: ScreenUtil().setWidth(38),
            direction: Axis.vertical,
          ),
        ],
      ),
    );
  }
}
