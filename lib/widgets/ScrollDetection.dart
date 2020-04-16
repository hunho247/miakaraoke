import 'package:flutter/widgets.dart';

class ScrollDetection {
  double _preOffset = 0;

  final Function onTap;
  ScrollController controller;
  bool isScrollDown = false;

  ScrollDetection(this.onTap) {
    controller = ScrollController();

    controller.addListener(() {
      if ((controller.offset - _preOffset > 0) &&
          !controller.position.outOfRange) {
        if (!isScrollDown) {
          isScrollDown = true;
          onTap();
        }
      } else if ((controller.offset - _preOffset < 0) &&
          !controller.position.outOfRange) {
        if (isScrollDown) {
          isScrollDown = false;
          onTap();
        }
      }

      _preOffset = controller.offset;
    });
  }
}
