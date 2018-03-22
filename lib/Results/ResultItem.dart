import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultItem extends StatelessWidget {
  const ResultItem(this.title, this.url, this.date);

  final String title;
  final String url;
  final String date;

  _launchURL() async {
//    const url = "http://www.google.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    return;
  }

  Widget _buildTile(String title, String url, String date) {
    return
      new RaisedButton(
          onPressed: _launchURL,
          color: Colors.white,
          child: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.only(bottom: 10.0),
                    child: new Text(title,
                        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
                    )
                ),
                new Container(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text(url,
                      style: new TextStyle(color: Colors.blue)
                  ),
                ),
                new Container(
                  child: new Text(date,
                      style: new TextStyle(fontSize: 12.0, color: Colors.grey[500])
                  ),
                ),
              ],
            ),

          )
      );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(this.title, this.url, this.date);
  }
}