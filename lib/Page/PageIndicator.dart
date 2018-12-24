import 'dart:ui';

import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final PageIndicators viewModel;

  PageIndicator({this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; i++) {
      final pages = viewModel.pages[i];
      bubbles.add(PageBubble(
        viewModel: PageIndicatorViewModel(
            color: pages.color,
            isHollow: false,
            activePercent: i == viewModel.activeIndex ? 1.0 : 0.0),
      ));
    }
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageBubble(
              viewModel: PageIndicatorViewModel(
                  color: Colors.white,
                  isHollow: false,
                  isActive: false,
                  activePercent: 0.0),
            ),
            PageBubble(
              viewModel: PageIndicatorViewModel(
                  color: Colors.white,
                  isHollow: false,
                  isActive: false,
                  activePercent: 1.0),
            ),
            PageBubble(
              viewModel: PageIndicatorViewModel(
                  color: Colors.white,
                  isHollow: true,
                  isActive: false,
                  activePercent: 0.0),
            ),
          ],
        )
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageIndicatorViewModel viewModel;

  PageBubble({this.viewModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: lerpDouble(20.0, 50.0, viewModel.activePercent),
        height: lerpDouble(20.0, 50.0, viewModel.activePercent),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? Colors.transparent
                : const Color(0x88ffffff),
            border: Border.all(
                color: viewModel.isHollow
                    ? const Color(0x88ffffff)
                    : Colors.transparent,
                width: 3.0)),
      ),
    );
  }
}

enum SlideDirection { LEFTTORIGHT, RIGHTTOLEFT }

class PageIndicators {
  final List<PageIndicatorViewModel> pages;
  final int activeIndex;
  final double slidePercent;
  final SlideDirection direction;

  PageIndicators(
      this.pages, this.activeIndex, this.slidePercent, this.direction);
}

class PageIndicatorViewModel {
  final Color color;
  final bool isHollow;
  final bool isActive;
  final double activePercent;

  PageIndicatorViewModel(
      {this.color, this.isHollow, this.isActive, this.activePercent});
}
