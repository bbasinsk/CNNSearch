import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {

  final ValueSetter<String> onSubmit;

  SearchBox(this.onSubmit);

  @override
  Widget build(BuildContext context) {

    //search box that onSubmit gets data for the results.
    var searchBox = new TextField(
      decoration: new InputDecoration(
        hintText: 'e.g. LeBron James',
        filled: true,
      ),
      onSubmitted: (searchQuery) {
        onSubmit(searchQuery);
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