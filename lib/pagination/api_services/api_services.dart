import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<dynamic>> fetchPosts(int start, int limit) async {
    final url = Uri.parse("$baseUrl?_start=$start&_limit=$limit");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
