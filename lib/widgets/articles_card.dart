import 'package:articles_/models/article.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class ArticleCard extends StatelessWidget {
  final Article card;
//article passed as parameter to the constructor
  ArticleCard({this.card});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      margin: EdgeInsets.fromLTRB(
        SizeConfig.safeBlockHorizontal * 1.5,
        SizeConfig.blockSizeVertical * 1.5,
        SizeConfig.safeBlockHorizontal * 1.5,
        SizeConfig.blockSizeVertical * 1.5,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.safeBlockHorizontal * 4,
          SizeConfig.blockSizeVertical * 3,
          SizeConfig.safeBlockHorizontal * 4,
          SizeConfig.blockSizeVertical * 3,
        ),
        alignment: Alignment.topCenter,
        child: Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //displaying the title
                  Text(
                    card.title,
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 4,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  //displaying the description
                  Text(card.description),
                  //displaying the image
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1.5,
                  ),
                  Container(
                    //    alignment: Alignment.center,
                    child: Image.network(
                      card.imageUrl,
                      height: SizeConfig.safeBlockVertical * 15,
                      width: SizeConfig.blockSizeHorizontal * 40,
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
