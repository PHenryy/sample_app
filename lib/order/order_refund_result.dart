import 'package:flutter/material.dart';
import 'package:sample_app/widgets/base_buttons.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/scaffold_with_bottom_bar.dart';

class OrderRefundResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      title: '退款申请',
      body: <Widget>[
        Container(),
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
