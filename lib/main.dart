import 'package:cnn_search/CnnSearchPage/CnnSearchPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CNN Search',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('CNN Search'),
        ),
        body: new Container(
          child: new CnnSearchPage(),
        )
      ),
    );
  }
}





