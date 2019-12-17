import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/base_buttons.dart';
import 'package:sample_app/widgets/base_fields.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/scaffold_with_bottom_bar.dart';

class OrderRefund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      title: '退款申请',
      body: <Widget>[
        Gutters.verticalGutter,
        SelectFieldItem(
          title: '处理方式',
          value: '退款（仅退款不退货）',
          withDivider: true,
        ),
        SelectFieldItem(
          title: '退款原因',
          value: '不想要了',
          withDivider: true,
        ),
        TextFieldItem(
          title: '退款说明',
          hintText: '选填',
          withDivider: true,
        ),
        BaseField(
          title: '退款金额',
          subtitle: '￥178.60',
          withDivider: true,
        ),
        UploadFieldItem(
          title: '上传凭证',
        ),
        Container(
          padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(30),
            left: ScreenUtil().setWidth(24),
          ),
          child: Text(
            '*提示：您可退款的最大金额为179.00',
            style: TextStyles.highlight1,
          ),
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
