import 'dart:math';

import 'package:flutter_demo/Page.dart';
import 'package:flutter/material.dart';

class PageReveal extends StatelessWidget {
  final double percentageVisible;
  final Widget child;

  PageReveal(this.percentageVisible, this.child);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipOval(
        child: child, clipper: CircleRevealClipper(percentageVisible));
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  final double revealPercentage;

  CircleRevealClipper(this.revealPercentage);

  @override
  Rect getClip(Size size) {
    final epicenter = Offset(size.width / 2, size.height * 0.9);
    double theta = atan(epicenter.dy / epicenter.dx);
    final distantToCorner = epicenter.dy / sin(theta);

    double radius = distantToCorner * revealPercentage;
    final diameter = 2 * radius;
    return Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
