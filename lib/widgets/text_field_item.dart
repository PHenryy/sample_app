import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/utils/number_text_input_formatter.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:sample_app/utils/text_styles.dart';

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (config != null && Utils.isIOS) {
    //   // 因Android平台输入法兼容问题，所以只配置IOS平台
    //   FormKeyboardActions.setKeyboardActions(context, config);
    // }
    return Container(
      height: maxLines == 1 ? 55.0 : maxLines * 55.0 * 0.75,
      margin: const EdgeInsets.only(left: 16.0, right: 16),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: maxLines == 1
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(title, style: TextStyles.body1)),
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  hintText: hintText,
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyles.body1),
            ),
          )
        ],
      ),
    );
  }
}
