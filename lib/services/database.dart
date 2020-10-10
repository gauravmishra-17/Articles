import 'package:articles_/models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference articleCollection =
      FirebaseFirestore.instance.collection('Articles');

  Future updateArticle(
      String title, String description, String imageUrl) async {
    return await articleCollection.doc().set({
      'Title': title,
      'Description': description,
      'Image Url': imageUrl,
    });
  }

  List<Article> _articleListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Article(
        title: doc.get('Title'),
        description: doc.get('Description'),
        imageUrl: doc.get('Image Url'),
      );
    }).toList();
  }

  Stream<List<Article>> get team {
    return articleCollection.snapshots().map(_articleListFromSnapshot);
  }
}
