import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseBackButton extends StatelessWidget {
  /// Creates an [IconButton] with the appropriate "back" icon for the current
  /// target platform.
  const BaseBackButton({Key key, this.color}) : super(key: key);

  /// The color to use for the icon.
  ///
  /// Defaults to the [IconThemeData.color] specified in the ambient [IconTheme],
  /// which usually matches the ambient [Theme]'s [ThemeData.iconTheme].
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        FontAwesomeIcons.chevronLeft,
        // size: ScreenUtil().setWidth(76),
      ),
      color: color,
      onPressed: () {
        Navigator.maybePop(context);
      },
    );
  }
}
