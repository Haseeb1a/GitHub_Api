import 'package:dio/dio.dart';
import '../model/github_model.dart';

class GithubConnections {
  final Dio _dio = Dio();

  Future<Github?> getGithub(String? user) async {
    try {
      final response = await _dio.get("https://api.github.com/users/$user");

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = response.data;
        print(response.data);
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
}
