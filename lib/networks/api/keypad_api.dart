import 'package:http/http.dart' as http;

class KeypadApi {
  final String baseUrl;

  KeypadApi(this.baseUrl);

  Future<http.Response> fetchData() async {
    final url = Uri.parse('$baseUrl/keypad');
    final response = await http.get(url);
    return response;
  }
}