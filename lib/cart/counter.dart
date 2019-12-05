import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counter extends StatefulWidget {
  Counter({this.from: 1, this.onChange});

  final int from;
  final Function(int) onChange;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count;
  @override
  void initState() {
    count = widget.from;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEEEEEE), width: 1),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: <Widget>[
            Container(
              color: count > 1 ? Colors.white : Color(0xFFF6F5FA),
              width: ScreenUtil.getInstance().setWidth(48.0),
              height: ScreenUtil.getInstance().setHeight(48.0),
              child: InkWell(
                onTap: () {
                  if (count > 1) {
                    setState(() {
                      count -= 1;
                      widget.onChange(count);
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
              height: ScreenUtil.getInstance().setHeight(48.0),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setHeight(28.0),
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
              child: Text('$count'),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(48.0),
              height: ScreenUtil.getInstance().setHeight(48.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    count += 1;
                    widget.onChange(count);
                  });
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
