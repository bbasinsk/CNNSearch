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
  var results = [
    new Result("Donald Trumpasdf", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trumpasdf", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trump", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trumpasdf", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trump", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trump", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trump", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trump", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
    new Result("Donald Trump", "http://www.cnn.com/donald-trump", "Feb 1st, 2018"),
  ];

  Widget build(BuildContext context) {
    var searchBox = new TextField(
      decoration: new InputDecoration(
        hintText: 'e.g. LeBron James',
        filled: true,
      ),
      onSubmitted: (searchQuery) {
        //TODO: add results from search
        print(searchQuery);
      },
    );

    var resultListBuilder =  new ListView.builder(
        itemBuilder: (context, index) {
          return new ResultItem(results[index].title, results[index].url, results[index].date);
        },
        itemCount: results.length,
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

