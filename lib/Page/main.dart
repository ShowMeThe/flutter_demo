import 'package:flutter/material.dart';
import 'package:flutter_demo/Page/Page.dart';
import 'package:flutter_demo/Page/PageReveal.dart';
import 'package:flutter_demo/Page/PageIndicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: new Stack(
          children: <Widget>[
            PageReveal(
                1.0,
                Page(
                  viewModel: pages[0],
                )),
            PageReveal(
                1.0,
                Page(
                  viewModel: pages[1],
                )),
            PageReveal(
                1.0,
                Page(
                  viewModel: pages[2],
                )),
            PageIndicator()
          ],
        )));
  }
}
