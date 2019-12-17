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
        Container(
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
                size: ScreenUtil().setWidth(16),
                direction: Axis.vertical,
              ),
              Text(
                '1、发起退款申请',
                style: TextStyles.body3sm,
              ),
              Gutter(
                size: ScreenUtil().setWidth(16),
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
