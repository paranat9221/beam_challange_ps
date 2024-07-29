import 'package:http/http.dart' as http;

class KeypadRepository {
  final String baseUrl;

  KeypadRepository(this.baseUrl);

  Future<String> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/keypad'));
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}