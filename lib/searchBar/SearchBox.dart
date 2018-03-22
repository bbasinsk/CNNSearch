import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //search box that onSubmit gets data for the results.
    var searchBox = new TextField(
      decoration: new InputDecoration(
        hintText: 'e.g. LeBron James',
        filled: true,
      ),
      onSubmitted: (searchQuery) {
        _getData(searchQuery).then((resList) {
          setState(() {
            _results = resList;
          });
        });
      },
    );

    //create a new container
    return new Container(
      padding: new EdgeInsets.all(15.0),
      color: Colors.grey[200],
      child: searchBox,
    );
  }
}