import 'package:http/http.dart' as http;

class HomeApi {
  final String baseUrl;

  HomeApi(this.baseUrl);

  Future<http.Response> fetchData() async {
    final url = Uri.parse('$baseUrl/home');
    final response = await http.get(url);
    return response;
  }
}