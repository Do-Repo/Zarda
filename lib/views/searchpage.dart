import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Search",
                focusColor: Theme.of(context).primaryColor,
                contentPadding: EdgeInsets.all(12),
                prefixIcon: Icon(Icons.search_outlined)),
          ),
        ],
      )),
    );
  }
}
