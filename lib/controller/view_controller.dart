import 'package:flutter/material.dart';
import '../model/github_model.dart';
import '../services/git_services.dart';

class GithubDataNotifier with ChangeNotifier {
  final GithubConnections apiClient = GithubConnections();
  Github? githubData;

  Future<Github?> fetchGitHubData(String name) async {
    githubData = await apiClient.getGithub(name);
    print(githubData!.name);
    return githubData;
    
  }
   getfromhive() async{
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
   await apiClient.getFromtheHive();
  }
}
