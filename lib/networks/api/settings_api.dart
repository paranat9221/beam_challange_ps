import 'package:http/http.dart' as http;

class SettingsApi {
  final String baseUrl;

  SettingsApi(this.baseUrl);

  Future<http.Response> fetchData() async {
    final url = Uri.parse('$baseUrl/settings');
    final response = await http.get(url);
    return response;
  }
}