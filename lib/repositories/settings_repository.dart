import 'package:http/http.dart' as http;

class SettingsRepository {
  final String baseUrl;

  SettingsRepository(this.baseUrl);

  Future<String> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/settings'));
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}