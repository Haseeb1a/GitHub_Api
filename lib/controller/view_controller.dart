import 'package:flutter/material.dart';
import '../model/github_model.dart';
import '../services/git_services.dart';

class GithubDataNotifier with ChangeNotifier {
  final Githubconnections apiClient = Githubconnections();
  Github? githubData;

  Future<Github?> fetchGitHubData(String name) async {
    githubData = await apiClient.getgithub(name);
    return githubData;
  }
}
