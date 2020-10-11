import 'package:articles_/models/article.dart';
import 'package:articles_/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'articles_card.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //this widget returns a stream from provider package which listens to the value of list of articles
    return StreamProvider<List<Article>>.value(
      //value passed to the stream
      value: DatabaseService().team,
      //passing a stateful widget that gives the present state of list of articles
      child: ArticleList(),
    );
  }
}

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    //Provider listener to listen to changes in the list of articles.
    final articles = Provider.of<List<Article>>(context);
    //prints the properties - title, description and image url of all the articles on the console
    articles.forEach((articles) {
      print(articles.title);
      print(articles.description);
      print(articles.imageUrl);
    });

    //returns a list of scrollable articles
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          //returns the widget of an article
          return ArticleCard(card: articles[index]);
        });
  }
}
