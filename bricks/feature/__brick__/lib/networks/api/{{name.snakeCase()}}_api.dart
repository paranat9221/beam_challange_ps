import 'package:http/http.dart' as http;

class {{name.pascalCase()}}Api {
  final String baseUrl;

  {{name.pascalCase()}}Api(this.baseUrl);

  Future<http.Response> fetchData() async {
    final url = Uri.parse('$baseUrl/{{name.snakeCase()}}');
    final response = await http.get(url);
    return response;
  }
}