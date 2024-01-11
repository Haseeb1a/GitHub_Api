import 'package:flutter/material.dart';
import 'package:github/controller/bottom_bar.controller.dart';
import 'package:github/controller/connectivity_controller.dart';
import 'package:github/controller/view_controller.dart';
import 'package:github/model/local_github.dart';
import 'package:github/views/home_page/home_page.dart';
import 'package:github/widgets/bottom_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'controller/home_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(LocalGithubAdapter().typeId)) {
    Hive.registerAdapter(LocalGithubAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckconnectivityProvider()),
        ChangeNotifierProvider(create: (context) => GithubDataNotifier()),
        ChangeNotifierProvider(create: (context) => Homecontroller()),
                ChangeNotifierProvider(create: (context) => BottomController())
      ],
      
      child: MaterialApp(
      
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
        
      ),
    );
  }
}
