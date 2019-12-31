import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:sample_app/widgets/base_back_button.dart';

const double kToolbarHeight = 56;
const double _kLeadingWidth = kToolbarHeight;

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  BaseAppBar({this.trailing, this.title = '媓钻官方商城'}) : super();

  final Widget trailing;
  final String title;

  @override
  _BaseAppBarState createState() => _BaseAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  void initState() {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFF34BBE7));
    super.initState();
  }

  final Widget leading = ConstrainedBox(
    constraints: const BoxConstraints.tightFor(
      width: _kLeadingWidth,
      height: _kLeadingWidth,
    ),
    child: BaseBackButton(
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                color: Color(0xFF34BBE7),
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(38.0),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: canPop ? leading : Container(),
              ),
              Positioned(
                  right: 0, top: 0, child: widget.trailing ?? Container())
            ],
          ),
        ),
      ),
    );
  }
}
