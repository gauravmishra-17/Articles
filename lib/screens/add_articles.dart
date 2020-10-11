import 'package:articles_/services/database.dart';
import 'package:flutter/material.dart';

class AddArticles extends StatefulWidget {
  @override
  _AddArticlesState createState() => _AddArticlesState();
}

class _AddArticlesState extends State<AddArticles> {
  //variables to store text field input data
  String title = "";
  String description = "";
  String imageUrl = "";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(children: <Widget>[
              //button to pop the widget and go back on navigation stack
              RaisedButton(
                child: Icon(Icons.home),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              //title for the below form field
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  child: Text("Add Articles"),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
            ]),
            //Form to accept the input
            Form(
              key: _formkey,
              child: Column(
                children: [
                  //input field to accept the title
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (val) => val.isEmpty ? "Enter Title" : null,
                    onChanged: (val) {
                      setState(() {
                        title = val;
                      });
                    },
                  ),
                  //input field to accept the description
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (val) =>
                        val.isEmpty ? "Enter Description" : null,
                    onChanged: (val) {
                      setState(() {
                        description = val;
                      });
                    },
                  ),
                  //input field to accept the image url
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Image Url',
                    ),
                    validator: (val) => val.isEmpty ? "Enter Image Url" : null,
                    onChanged: (val) {
                      setState(() {
                        imageUrl = val;
                      });
                    },
                  ),
                  //clickable button to upload the input to Firestore
                  RaisedButton(
                      child: Text("Add "),
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () async {
                        //print Tapped on the console when the button is tapped
                        print("TAPPED");
                        //checks if any validator has returned null in any of the input field
                        if (_formkey.currentState.validate()) {
                          // A future method is called to update the Collections
                          await DatabaseService()
                              .updateArticle(title, description, imageUrl);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
