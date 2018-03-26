import 'package:cnn_search/Results/NBAResult.dart';
import 'package:cnn_search/Results/StatWidget.dart';
import 'package:flutter/material.dart';


class NBAResultWidget extends StatelessWidget {

  final NBAResult _nbaResult;
  const NBAResultWidget(this._nbaResult);

  @override
  Widget build(BuildContext context) {
    var playerInfo = new Padding(
      padding: new EdgeInsets.only(bottom: 20.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Placeholder(fallbackHeight: 100.0, fallbackWidth: 100.0),
          new Padding(padding: new EdgeInsets.only(left: 20.0)),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_nbaResult.title,
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              new Row(children: <Widget>[
                new Text("Team:"),
                new Text(_nbaResult.team,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          )
        ],
      ),
    );

    var stats =  new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new StatWidget("AST", _nbaResult.ast),
        new StatWidget("GP", _nbaResult.gp),
        new StatWidget("PPG", _nbaResult.ppg),
        new StatWidget("REB", _nbaResult.reb),
        new StatWidget("3PTM", _nbaResult.ptm3),
      ],
    );

    return new Padding(
      padding: new EdgeInsets.fromLTRB(75.0, 20.0, 75.0, 20.0),
      child: new Column(
        children: <Widget>[
          playerInfo,
          stats,
        ],
      ),
    );

  }
}