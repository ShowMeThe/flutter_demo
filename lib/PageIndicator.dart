import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0x88ffffff), width: 3.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0x88ffffff), width: 3.0)),
              ),
            ),
          ],
        )
      ],
    );
  }
}

enum SlideDirection { LEFTTORIGHT, RIGHTTOLEFT }

class PageIndicators {
  final List<PageIndicatorViewModel> pages;
  final int activeIndex;
  final double slidePecent;
  final SlideDirection direction;

  PageIndicators(this.pages, this.activeIndex, this.slidePecent,
      this.direction);


}

class PageIndicatorViewModel {
  final String content;
  final Color color;
  final bool isHollow;
  final bool isActive;
  final double activePercent;

  PageIndicatorViewModel(
      {this.content,
      this.color,
      this.isHollow,
      this.isActive,
      this.activePercent});
}
