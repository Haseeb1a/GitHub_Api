import 'package:flutter/material.dart';
import '../model/githubmodel.dart';
import '../services/gitservices.dart';

class GithubDataNotifier with ChangeNotifier {
  final Githubconnections apiClient = Githubconnections();

  Github? githubData;
    Future<Github?> fetchWeatherData(String name) {
    return apiClient.getgithub(name);
  }
}
