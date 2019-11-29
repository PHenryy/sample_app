import 'package:flutter/material.dart';
import 'dart:async';

class TextCarousel extends StatefulWidget {
  TextCarousel({
    Key key,
    @required this.texts,
    this.animationDuration: 4000,
    this.init: 0,
  }) : super(key: key);

  final List texts;
  final int animationDuration;
  final int init;

  @override
  _TextCarouselState createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  int currentIndex = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    this.currentIndex = widget.init;
    final Duration animateDuration = this.getDuration();

    timer = Timer.periodic(animateDuration, (timer) {
      this.handleTimeOut();
    });
  }

  void handleTimeOut() {
    this.setState(() {
      if (this.currentIndex == 3) {
        this.currentIndex = 0;
      } else {
        this.currentIndex += 1;
      }
    });
  }

  Duration getDuration() {
    return Duration(
      seconds: widget.animationDuration ~/ 1000,
    );
  }

  @override
  Widget build(BuildContext context) {
    // String next() {
    //   if (currentIndex == 3) {
    //     return widget.texts[0];
    //   }

    //   return widget.texts[currentIndex + 1];
    // }

    return AnimatedSwitcher(
      child: Text(
        widget.texts[this.currentIndex],
        key: ValueKey(this.currentIndex),
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
      duration: this.getDuration(),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = TweenSequence([
          TweenSequenceItem(
              tween:
                  Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)),
              weight: 1),
          TweenSequenceItem(tween: ConstantTween(Offset(0.0, 0.0)), weight: 3),
          TweenSequenceItem(
              tween: Tween<Offset>(
                  begin: Offset(0.0, 0.0), end: Offset(0.0, -1.0)),
              weight: 1)
        ]).animate(animation);
        return ClipRect(
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      },
      layoutBuilder: (Widget currentChild, List<Widget> previousChildren) {
        return currentChild;
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
