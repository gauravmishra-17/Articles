import 'package:articles_/models/article.dart';
import 'package:articles_/services/database.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final Article card;

  ArticleCard({this.card});

  @override
  Widget build(BuildContext context) {
    final DatabaseService _data = DatabaseService();
    return Card(
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Row(
        children: <Widget>[
          Column(children: <Widget>[
            Text(card.title),
            Text(card.description),
            Container(
              child: Image(
                height: 50,
                width: 50,
                image: NetworkImage(card.imageUrl),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
