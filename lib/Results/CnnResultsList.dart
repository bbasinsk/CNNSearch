import 'package:flutter/material.dart';

import 'package:cnn_search/Results/CnnResult.dart';
import 'package:cnn_search/Results/CnnResultWidget.dart';

class ResultList extends StatelessWidget {

  final _results;
  ResultList(this._results);

  @override
  Widget build(BuildContext context) {
    var resultListBuilder =  new ListView.builder(
      itemBuilder: (context, index) {
        CnnResult tile = _results[index];
        return new CnnResultWidget(tile.title, tile.url, tile.date);
      },
      itemCount: _results.length,
    );

    return new Expanded(
        child: resultListBuilder
    );
  }
}