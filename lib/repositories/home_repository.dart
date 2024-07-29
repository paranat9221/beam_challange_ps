import 'package:http/http.dart' as http;

class HomeRepository {
  final String baseUrl;

  HomeRepository(this.baseUrl);

  Future<String> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/home'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
