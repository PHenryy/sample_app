import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/widgets/base_fields.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/base_header.dart';

class EditUserAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '新建地址',
      ),
      body: Column(
        children: <Widget>[
          Gutters.verticalGutter,
          TextFieldItem(
            title: '收货人',
            hintText: '请填写收货人名字',
            withDivider: true,
          ),
          TextFieldItem(
            title: '联系电话',
            hintText: '请填写联系电话',
            withDivider: true,
          ),
          TextFieldItem(
            title: '所在地区',
            hintText: '所在地区',
            withDivider: true,
          ),
          TextFieldItem(
            title: '详细地址',
            hintText: '街道，楼牌号等',
            withDivider: true,
          ),
          BaseHeader(
            height: 100,
            title: '设置默认地址',
            trailing: CupertinoSwitch(
              onChanged: (bool value) {},
              value: true,
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(52),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: ScreenUtil().setWidth(686),
                minHeight: ScreenUtil().setWidth(80),
              ),
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(10),
                  ),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  '保存地址',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(28),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
