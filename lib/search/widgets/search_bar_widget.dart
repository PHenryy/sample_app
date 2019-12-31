import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:sample_app/widgets/Gutter.dart';

class SearchBarWidget extends StatefulWidget implements PreferredSizeWidget {
  SearchBarWidget({
    this.onSearch,
  });

  final Function(String) onSearch;

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(48);
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: SafeArea(
          child: Container(
            child: Row(
              children: <Widget>[
                Gutter(
                  size: 12,
                ),
                Expanded(
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      onSubmitted: (val) {
                        widget.onSearch(val);
                      },
                      textInputAction: TextInputAction.search,
                      controller: _controller,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: '搜索',
                        contentPadding: EdgeInsets.only(
                          top: 0,
                          left: -8,
                          right: -16,
                          bottom: 12,
                        ),
                        border: InputBorder.none,
                        icon: Padding(
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 12,
                          ),
                          child: Icon(
                            Icons.search,
                            size: 18,
                            color: Color(0xFF999999),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            _controller.text = '';
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              right: 12,
                              bottom: 8,
                              left: 16,
                            ),
                            child: Icon(
                              Icons.highlight_off,
                              size: 18,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Text('取消'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
