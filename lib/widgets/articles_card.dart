import 'package:articles_/models/article.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final Article card;
//article passed as parameter to the constructor
  ArticleCard({this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Row(
        children: <Widget>[
          Column(children: <Widget>[
            //displaying the title
            Text(card.title),
            //displaying the description
            Text(card.description),
            //displaying the image
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
