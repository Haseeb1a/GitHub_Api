import 'package:dio/dio.dart';
import '../model/github_model.dart';

class GithubConnections {
  final Dio _dio = Dio();

  Future<Github?> getGithub(String? user) async {
    try {
      if (user == null) {
        throw Exception('User is null. Please provide a valid username.');
      }

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
      // Handle the exception or rethrow it if needed.
      // You can log the error or perform additional error handling here.
      return null; // You may want to return null or another default value in case of an error.
    }
  }
}
