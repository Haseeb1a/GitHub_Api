import 'package:flutter/material.dart';

import '../model/githubmodel.dart';
import '../services/gitservices.dart';

class Profilecontroller extends ChangeNotifier {
  final Githubconnections apiClient = Githubconnections();
  Github? githubData;
  Future<void> fetchGithubData(String user) async {
    //  final userdata= Provider.of<Homecontroller>(context,listen: fa);
    final response = await apiClient.getgithub(user);
    // setState(() {
    githubData = response;
    notifyListeners();

    // });
  }
}
