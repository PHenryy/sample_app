import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counter extends StatefulWidget {
  Counter({
    this.from = 1,
    this.onChange,
    this.min,
    this.max,
  });

  final int from;
  final int min;
  final int max;
  final Function(int) onChange;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count;
  @override
  void initState() {
    _count = widget.from;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _subtractDisabled = false;
    bool _addDisabled = false;

    if (widget.min != null) {
      _subtractDisabled = _count <= widget.min ? true : false;
    }

    if (widget.max != null) {
      _addDisabled = _count >= widget.max ? true : false;
    }

    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFEEEEEE),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: <Widget>[
            Container(
              color: _subtractDisabled ? Color(0xFFF6F5FA) : Colors.white,
              width: ScreenUtil().setWidth(48.0),
              height: ScreenUtil().setHeight(48.0),
              child: InkWell(
                onTap: () {
                  if (!_subtractDisabled) {
                    setState(() {
                      _count -= 1;

                      if (widget.onChange != null) {
                        widget.onChange(_count);
                      }
                    });
                  }
                },
                child: Icon(
                  Icons.remove,
                  size: 12.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(48.0),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setHeight(28.0),
              ),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1,
                  ),
                ),
              ),
              child: Text('$_count'),
            ),
            Container(
              color: _addDisabled ? Color(0xFFF6F5FA) : Colors.white,
              width: ScreenUtil().setWidth(48.0),
              height: ScreenUtil().setHeight(48.0),
              child: InkWell(
                onTap: () {
                  if (!_addDisabled) {
                    setState(() {
                      _count += 1;
                      if (widget.onChange != null) {
                        widget.onChange(_count);
                      }
                    });
                  }
                },
                child: Icon(
                  Icons.add,
                  size: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
