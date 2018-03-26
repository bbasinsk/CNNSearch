import 'package:cnn_search/CnnSearchPage/CnnSearchPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final String appName = 'Ben\'s Search';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appName,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(appName),
        ),
        body: new Container(
          child: new CnnSearchPage(),
        )
      ),
    );
  }
}





