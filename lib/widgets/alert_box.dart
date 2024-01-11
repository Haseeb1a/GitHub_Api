// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:github/model/local_github.dart';
import 'package:github/widgets/bottom_bar.dart';
import 'package:hive/hive.dart';

//clear from db - reset

Future<void> resetDB(
  BuildContext context,
) async {
  // ignore: use_build_context_synchronously
  bool confirmReset = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          "Clear History",
          style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
        ),
        content: const Text(
          " you want clear the history",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 254)),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text(
              "clear",
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );

  if (confirmReset == true) {
    final githubdata = await Hive.openBox<LocalGithub>('person_db');
    githubdata.clear().then((value) {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ));
    });
   
  }
}
