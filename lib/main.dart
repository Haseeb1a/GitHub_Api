import 'package:flutter/material.dart';
import 'package:github/controller/homecontroller.dart';
import 'package:github/controller/profilepage.dart';
import 'package:github/views/firstpage.dart';
import 'package:provider/provider.dart';
import 'model/githubmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context)=>Homecontroller()),
         ChangeNotifierProvider(create: (context)=>Profilecontroller()),
         
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
