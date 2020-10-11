import 'package:articles_/services/database.dart';
import 'package:articles_/size_config.dart';
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
  final titleHolder = TextEditingController();
  final descriptionHolder = TextEditingController();
  final imageUrlHolder = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  clearTextInput() {
    titleHolder.clear();
    descriptionHolder.clear();
    imageUrlHolder.clear();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            //button to pop the widget and go back on navigation stack
            Row(
              children: <Widget>[
                BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                //title for the below form field
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 7,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 6),
                    child: Text(
                      "Add Articles",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockVertical * 3),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            //Form to accept the input
            Form(
              key: _formkey,
              child: Column(
                children: [
                  //input field to accept the title
                  TextFormField(
                    controller: titleHolder,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (val) => val.isEmpty ? "Enter Title" : null,
                    onChanged: (val) {
                      setState(() {
                        title = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //input field to accept the description
                  TextFormField(
                    controller: descriptionHolder,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (val) =>
                        val.isEmpty ? "Enter Description" : null,
                    onChanged: (val) {
                      setState(() {
                        description = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //input field to accept the image url
                  TextFormField(
                    controller: imageUrlHolder,
                    decoration: InputDecoration(
                        labelText: 'Image Url',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (val) => val.isEmpty ? "Enter Image Url" : null,
                    onChanged: (val) {
                      setState(() {
                        imageUrl = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
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
                        clearTextInput();
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
