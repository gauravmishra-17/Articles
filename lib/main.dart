import 'package:articles_/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles',
      debugShowCheckedModeBanner: false,
      //instance of a class which first displays the widget when the app builds.
      home: MyHomePage(),
    );
  }
}
