import 'package:flutter/material.dart';

class StatWidget extends StatelessWidget {

  final String title;
  final String value;
  StatWidget(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    var stat =

      new Column(
        children: <Widget>[
          new Text(this.title,
            style: new TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold
            ),
          ),
          new Padding(padding: new EdgeInsets.only(top: 5.0)),
          new Text(this.value),
        ],

    );

    return stat;
  }
}

