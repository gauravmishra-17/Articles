import 'package:articles_/widgets/articles_list.dart';
import 'package:flutter/material.dart';

import 'add_articles.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("Add Articles"),
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddArticles()),
                );
              },
            ),
            Expanded(child: Articles()),
          ],
        ),
      ),
    );
  }
}
