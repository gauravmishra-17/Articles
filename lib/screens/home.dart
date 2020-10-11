import 'package:articles_/widgets/articles_list.dart';
import 'package:flutter/material.dart';

import 'add_articles.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title describing the contents of the body
        title: Text("Articles"),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Center(
        child: Column(
          //contains the widgets that will be displayed in the body

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //a clickable button which on pressing navigates to and builds a widget on the stack
            RaisedButton(
              child: Text("Add Articles"),
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                //Navigation from the current widget to the designated widget passed as parameter in the function for MaterialPageRoute() widget
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddArticles()),
                );
              },
            ),
            //This widegt returns a list of articles that have been uploaded to the Firebase
            Expanded(child: Articles()),
          ],
        ),
      ),
    );
  }
}
