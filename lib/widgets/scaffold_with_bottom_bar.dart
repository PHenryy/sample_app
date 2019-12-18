import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/widgets/base_app_bar.dart';

class ScaffoldWithBottomBar extends StatelessWidget {
  ScaffoldWithBottomBar({
    this.title,
    this.body,
    this.footer,
  });

  final String title;
  final List<Widget> body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: title,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: body,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: ScreenUtil().setWidth(100),
            child: footer,
          ),
        ],
      ),
    );
  }
}
