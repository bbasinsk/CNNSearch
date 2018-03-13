import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
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
          child: new ResultsPage(),
        )
      ),
    );
  }
}

class Result {
  Result(this.title, this.url, this.date);
  final String title;
  final String url;
  final String date;
}

class ResultsPage extends StatefulWidget {
  @override
  createState() => new ResultsState();
}

class ResultsState extends State<ResultsPage> {
  List<Result> _results = new List<Result>();

  _getData(String searchQuery) async {
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

    setState(() {
      _results = resultList;
    });
  }

  Widget build(BuildContext context) {
    var searchBox = new TextField(
      decoration: new InputDecoration(
        hintText: 'e.g. LeBron James',
        filled: true,
      ),
      onSubmitted: (searchQuery) {
        _getData(searchQuery);
      },
    );

    var resultListBuilder =  new ListView.builder(
        itemBuilder: (context, index) {
          Result tile = _results[index];
          return new ResultItem(tile.title, tile.url, tile.date);
        },
        itemCount: _results.length,
    );

    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(15.0),
          color: Colors.grey[200],
          child: searchBox,
        ),
        new Expanded(
            child: resultListBuilder
        ),
      ]
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem(this.title, this.url, this.date);

  final String title;
  final String url;
  final String date;

  Widget _buildTile(String title, String url, String date) {
    return new Container(
      padding: const EdgeInsets.all(5.0),
      child: new ListTile(
        title: new Text(title),
        subtitle: new Text(url),
        trailing: new Text(date),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildTile(this.title, this.url, this.date);
  }
}

