import 'package:http/http.dart' as http;

class {{name.pascalCase()}}Repository {
  final String baseUrl;

  {{name.pascalCase()}}Repository(this.baseUrl);

  Future<String> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/{{name.snakeCase()}}'));
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}