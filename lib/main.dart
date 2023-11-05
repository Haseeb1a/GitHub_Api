import 'package:flutter/material.dart';
import 'package:github/controller/viewcontroller.dart';
import 'package:github/views/homepage/homepage.dart';
import 'package:provider/provider.dart';

import 'controller/homecontroller copy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GithubDataNotifier()),
        ChangeNotifierProvider(create: (context) => Homecontroller())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
