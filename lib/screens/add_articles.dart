import 'package:articles_/services/database.dart';
import 'package:flutter/material.dart';

class AddArticles extends StatefulWidget {
  @override
  _AddArticlesState createState() => _AddArticlesState();
}

class _AddArticlesState extends State<AddArticles> {
  String title = "";
  String description = "";
  String imageUrl = "";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (val) => val.isEmpty ? "Enter Description" : null,
                onChanged: (val) {
                  setState(() {
                    description = val;
                  });
                },
              ),
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
              RaisedButton(
                  child: Text("Add "),
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    print("TAPPED");
                    if (_formkey.currentState.validate()) {
                      await DatabaseService()
                          .updateArticle(title, description, imageUrl);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
