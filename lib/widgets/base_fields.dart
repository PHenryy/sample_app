import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/utils/number_text_input_formatter.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/utils/paddings.dart';

class BaseField extends StatelessWidget {
  BaseField({
    this.title,
    this.subtitle,
    this.height = 100,
    this.content,
    this.tailingIcon,
    this.trailingIcon,
    this.onPressed,
    this.contentStyle,
    this.withDivider = false,
  });

  final String title;
  final String subtitle;
  final double height;
  final String content;
  final IconData tailingIcon;
  final IconData trailingIcon;
  final Function onPressed;
  final TextStyle contentStyle;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    double _height = ScreenUtil().setWidth(height);
    TextStyle defaultContentStyle = TextStyle(
      fontSize: ScreenUtil().setSp(26),
      color: Color(0xFF666666),
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: _height,
        color: Colors.white,
        child: Container(
          margin: Paddings.fieldPadding,
          decoration: BoxDecoration(
            border: withDivider
                ? Border(
                    bottom: BorderSide(
                      width: ScreenUtil().setWidth(1),
                      color: Color(0xFFD9D9D9),
                    ),
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  tailingIcon == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(
                            right: ScreenUtil().setWidth(8),
                          ),
                          child: Icon(tailingIcon),
                        ),
                  Text(
                    title,
                    style: TextStyles.body1,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(44),
                  ),
                  subtitle == null
                      ? Container()
                      : Text(
                          subtitle,
                          style: TextStyles.body1,
                        ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  if (content != null)
                    Text(
                      content,
                      style: defaultContentStyle.merge(contentStyle),
                    ),
                  trailingIcon == null ? Container() : Icon(trailingIcon),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectFieldItem extends StatelessWidget {
  SelectFieldItem({
    this.title,
    this.value,
    this.onTap,
    this.withDivider = false,
  });

  final String title;
  final String value;
  final Function onTap;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minHeight: ScreenUtil().setWidth(100),
        ),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            border: withDivider
                ? Border(
                    bottom: BorderSide(
                      width: ScreenUtil().setWidth(1),
                      color: Color(0xFFD9D9D9),
                    ),
                  )
                : null,
          ),
          margin: Paddings.fieldPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Wrap(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyles.body2,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(44),
                    ),
                    Text(
                      value,
                      style: TextStyles.body1,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadFieldItem extends StatelessWidget {
  UploadFieldItem({
    this.title,
    this.height = 156,
    this.content,
    this.tailingIcon,
    this.onPressed,
    this.contentStyle,
    this.withDivider = false,
  });

  final String title;
  final double height;
  final String content;
  final IconData tailingIcon;
  final Function onPressed;
  final TextStyle contentStyle;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    double _height = ScreenUtil().setWidth(height);
    TextStyle defaultContentStyle = TextStyle(
      fontSize: ScreenUtil().setSp(26),
      color: Color(0xFF666666),
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: _height,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(23),
            right: ScreenUtil().setWidth(23),
          ),
          decoration: BoxDecoration(
            border: withDivider
                ? Border(
                    bottom: BorderSide(
                      width: ScreenUtil().setWidth(1),
                      color: Color(0xFFD9D9D9),
                    ),
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  tailingIcon == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(
                            right: ScreenUtil().setWidth(8),
                          ),
                          child: Icon(tailingIcon),
                        ),
                  Text(
                    title,
                    style: TextStyles.body1,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(44),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setWidth(80),
                    color: Color(0xFFF6F5F5),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFE5E2E2),
                      ),
                    ),
                  ),
                ],
              ),
              if (content != null)
                Text(
                  content,
                  style: defaultContentStyle.merge(contentStyle),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 封装输入框
// class TextFieldItem extends StatelessWidget {
//   const TextFieldItem(
//       {Key key,
//       this.controller,
//       @required this.title,
//       this.keyboardType: TextInputType.text,
//       this.hintText: "",
//       this.focusNode,
//       this.config})
//       : super(key: key);

//   final TextEditingController controller;
//   final String title;
//   final String hintText;
//   final TextInputType keyboardType;
//   final FocusNode focusNode;
//   final KeyboardActionsConfig config;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.0,
//       margin: const EdgeInsets.only(left: 16.0),
//       width: double.infinity,
//       decoration: BoxDecoration(
//           border: Border(
//         bottom: Divider.createBorderSide(context, width: 0.6),
//       )),
//       child: Row(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: Text(title),
//           ),
//           Expanded(
//             flex: 1,
//             child: TextField(
//                 focusNode: focusNode,
//                 keyboardType: keyboardType,
//                 inputFormatters: _getInputFormatters(),
//                 controller: controller,
//                 //style: TextStyles.textDark14,
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   border: InputBorder.none, //去掉下划线
//                   //hintStyle: TextStyles.textGrayC14
//                 )),
//           ),
//           SizedBox(
//             height: ScreenUtil().setWidth(16),
//           ),
//         ],
//       ),
//     );
//   }

//   _getInputFormatters() {
//     if (keyboardType == TextInputType.numberWithOptions(decimal: true)) {
//       return [UsNumberTextInputFormatter()];
//     }
//     if (keyboardType == TextInputType.number ||
//         keyboardType == TextInputType.phone) {
//       return [WhitelistingTextInputFormatter.digitsOnly];
//     }
//     return null;
//   }
// }

class TextFieldItem extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final KeyboardActionsConfig config;
  final FocusNode nextFocusNode;
  final int maxLines;
  final int maxLength;
  final bool withDivider;

  const TextFieldItem({
    Key key,
    this.controller,
    @required this.title,
    this.keyboardType: TextInputType.text,
    this.hintText: "",
    this.focusNode,
    this.nextFocusNode,
    this.config,
    this.maxLines: 1,
    this.maxLength,
    this.withDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (config != null && Utils.isIOS) {
    //   // 因Android平台输入法兼容问题，所以只配置IOS平台
    //   FormKeyboardActions.setKeyboardActions(context, config);
    // }
    return Container(
      height: maxLines == 1
          ? ScreenUtil().setWidth(100)
          : ScreenUtil().setWidth(maxLines * 100 * 0.75),
      color: Colors.white,
      child: Container(
        margin: Paddings.fieldPadding,
        decoration: BoxDecoration(
          border: withDivider
              ? Border(
                  bottom: BorderSide(
                    width: ScreenUtil().setWidth(1),
                    color: Color(0xFFD9D9D9),
                  ),
                )
              : null,
        ),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: maxLines == 1
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setWidth(100),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(44),
              ),
              child: Text(
                title,
                style: TextStyles.body2,
              ),
            ),
            Expanded(
              child: TextField(
                maxLength: maxLength,
                style: TextStyles.body1,
                maxLines: maxLines,
                focusNode: focusNode,
                keyboardType: keyboardType,
                inputFormatters: (keyboardType == TextInputType.number ||
                        keyboardType == TextInputType.phone)
                    ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
                    : keyboardType ==
                            TextInputType.numberWithOptions(decimal: true)
                        ? [UsNumberTextInputFormatter()]
                        : [BlacklistingTextInputFormatter(RegExp(""))],
                controller: controller,
                onEditingComplete: nextFocusNode == null
                    ? null
                    : () => FocusScope.of(context).requestFocus(nextFocusNode),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setWidth(32),
                  ),
                  hintText: hintText,
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyles.body3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
