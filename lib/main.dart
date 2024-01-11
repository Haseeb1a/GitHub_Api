import 'package:flutter/material.dart';
import 'package:github/controller/connectivity_controller.dart';
import 'package:github/controller/view_controller.dart';
import 'package:github/views/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'controller/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckconnectivityProvider()),
        ChangeNotifierProvider(create: (context) => GithubDataNotifier()),
        ChangeNotifierProvider(create: (context) => Homecontroller())
      ],
      
      child: MaterialApp(
      
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
