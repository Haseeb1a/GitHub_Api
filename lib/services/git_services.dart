import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github/model/local_github.dart';
import 'package:hive_flutter/adapters.dart';
import '../model/github_model.dart';

ValueNotifier<List<LocalGithub>> githubData = ValueNotifier([]);

class GithubConnections {
  final Dio _dio = Dio();

  Future<Github?> getGithub(String? user) async {
    try {
      final response = await _dio.get("https://api.github.com/users/$user");

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = response.data;
        print(response.data);
        // print(object)
        //
        // remove.add(Github.fromJson(body));
        await addHiveData(LocalGithub.fromJson(body));
        return Github.fromJson(body);
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getGithub: $e');
      return null;
    }
  }

  Future addHiveData(value) async {
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(value);

    final persondata = await Hive.openBox<LocalGithub>('person_db');
    // if (persondata.values.contains(user)) {
    //   return;
    // } else {
    //   print('jldfhldjghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    // }
    final id = await persondata.add(value);
    print(id);
    print(value);

    // persondata.add(value);
    githubData.value.clear();
    githubData.value.addAll(persondata.values);
    githubData.notifyListeners();
    getFromtheHive();

    // githubData.notifyListeners();
  }

  Future<void> getFromtheHive() async {
    final personDataBox = await Hive.openBox<LocalGithub>('person_db');
    githubData.value.clear();
    githubData.value.addAll(personDataBox.values);
    githubData.notifyListeners();
  }

  Future<void> deleteFromTheHive(int index) async {
    final personDataBox = await Hive.openBox<LocalGithub>('person_db');
    personDataBox.deleteAt(index);
    getFromtheHive();
    githubData.notifyListeners();
  }
}
