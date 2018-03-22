import 'package:cnn_search/Results/Result.dart';
import 'package:cnn_search/Results/ResultItem.dart';
import 'package:cnn_search/SearchBar/SearchBox.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:xml/xml.dart' as xml;

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

class CnnSearchPage extends StatefulWidget {
  @override
  createState() => new CnnSearchPageState();
}

class CnnSearchPageState extends State<CnnSearchPage> {
  List<Result> _results = new List<Result>();

  Future<List<Result>> _getData(String searchQuery) async {
    List<Result> resultList = new List<Result>();
    
    var httpClient = new HttpClient();
    var uri = new Uri.http('pa04benbasinski.cloudapp.net', '/Crawler.asmx/Search', {'query': searchQuery});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();

    if (response.statusCode == HttpStatus.OK) {
      var xmlText = await response.transform(UTF8.decoder).join();
      var xmlDocument = xml.parse(xmlText);
      var jsonText = xmlDocument.rootElement.children.toString();
      var data = JSON.decode(jsonText);

      for (var r in data[0]) {
        Result result = new Result(r['Title'], r['URL'], r['DateString']);
        resultList.add(result);
      }
    }
    return resultList;
  }

  void onSubmit(searchQuery) {
    _getData(searchQuery).then((resList) {
      setState(() {
        _results = resList;
      });
    });
  }

  Widget build(BuildContext context) {
    var resultListBuilder =  new ListView.builder(
        itemBuilder: (context, index) {
          Result tile = _results[index];
          return new ResultItem(tile.title, tile.url, tile.date);
        },
        itemCount: _results.length,
    );

    return new Column(
      children: <Widget>[
        new SearchBox(onSubmit),
        new Expanded(
            child: resultListBuilder
        ),
      ]
    );
  }
}



