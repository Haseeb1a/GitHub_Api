import 'package:flutter/material.dart';
import 'package:github/views/firstpage.dart';
import 'model/githubmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHomePage(), 
    );
  }
}

