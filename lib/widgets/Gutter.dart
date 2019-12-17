import 'package:flutter/material.dart';

class Gutter extends StatelessWidget {
  Gutter({
    @required this.size,
    this.direction = Axis.horizontal,
  });

  final double size;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: direction == Axis.horizontal ? size : 0,
      height: direction == Axis.vertical ? size : 0,
    );
  }
}
