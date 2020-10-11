import 'package:articles_/models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference to help in interaction with the Firestore with the help of methods
  final CollectionReference articleCollection =
      //declaring the name of the collection
      FirebaseFirestore.instance.collection('Articles');

//a Future async method to update the articles collection with an article
  Future updateArticle(
      String title, String description, String imageUrl) async {
    return await articleCollection.doc().set({
      'Title': title,
      'Description': description,
      'Image Url': imageUrl,
    });
  }

//returns the list of objects mapped from the fetched snapshot to a model Article
  List<Article> _articleListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Article(
        //gets and assigins the value to title, description and imageUrl properties of Article
        title: doc.get('Title'),
        description: doc.get('Description'),
        imageUrl: doc.get('Image Url'),
      );
    }).toList();
  }

//stream that listens to  the snapshot of the collection
  Stream<List<Article>> get team {
    //returns the snapshot of the collection and maps it into an object of Article
    return articleCollection.snapshots().map(_articleListFromSnapshot);
  }
}
