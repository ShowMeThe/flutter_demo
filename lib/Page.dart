import 'package:flutter/material.dart';

final pages = [
  PageViewModel(
      Colors.blue, "assets/images/hotel.png", "Hotel", "This is body", null),
  PageViewModel(Colors.greenAccent, "assets/images/hotel_1.png", "Hotel_1",
      "This is body", null),
  PageViewModel(Colors.pinkAccent, "assets/images/hotel_2.png", "Hotel_2",
      "This is body", null)
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentageVisible;

  Page({this.viewModel, this.percentageVisible = 1.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: double.infinity,
      color: viewModel.color,
      child: Opacity(
        opacity: percentageVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 50.0 * (1.0 - percentageVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Image.asset(
                  viewModel.assestPath,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentageVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  viewModel.title,
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: "FlamanteRoma",
                      fontSize: 34.0),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentageVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  viewModel.body,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "FlamanteRoma",
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String assestPath;
  final String title;
  final String body;
  final String assestIcon;

  PageViewModel(
      this.color, this.assestPath, this.title, this.body, this.assestIcon);
}
