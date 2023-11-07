
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/github_model.dart';

class Githubconnections{
  Future<Github?> getgithub(String? user) async {
    var endpoint = Uri.parse("https://api.github.com/users/$user");
    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);
      return Github.fromJson(body);
    } else {
     throw Exception('Failed to load data');
    }
  }
}
