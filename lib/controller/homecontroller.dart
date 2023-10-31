import 'package:flutter/material.dart';

import '../model/githubmodel.dart';
import '../services/gitservices.dart';

class homecontroller extends ChangeNotifier {
  final Githubconnections apiClient = Githubconnections();
  Github? githubData;
  Future<void> fetchGithubData(String user) async {
    final response = await apiClient.getgithub(user);
    // setState(() {
    githubData = response;
    notifyListeners();
    // });
  }
}
