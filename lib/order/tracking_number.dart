import 'package:flutter/material.dart';
import 'package:sample_app/widgets/base_buttons.dart';
import 'package:sample_app/widgets/base_fields.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/base_header.dart';
import 'package:sample_app/widgets/scaffold_with_bottom_bar.dart';

class TrackingNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      title: '售后申请',
      body: <Widget>[
        BaseHeader(
          title: '填写快递单号',
        ),
        Gutters.verticalGutter,
        BaseField(
          title: '快递公司',
          trailingIcon: Icons.chevron_right,
          withDivider: true,
        ),
        BaseField(
          title: '快递单号',
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
