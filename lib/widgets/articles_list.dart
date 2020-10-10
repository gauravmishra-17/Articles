import 'package:articles_/models/article.dart';
import 'package:articles_/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'articles_card.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Article>>.value(
      value: DatabaseService().team,
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
    final articles = Provider.of<List<Article>>(context);
    articles.forEach((player) {
      print(player.title);
      print(player.description);
      print(player.imageUrl);
    });
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(card: articles[index]);
        });
  }
}
