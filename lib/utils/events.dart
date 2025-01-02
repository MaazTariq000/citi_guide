import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictHQService {
  static const String _baseUrl = 'https://api.predicthq.com/v1/events/';
  static const String _apiKey = '9QZcc9D94vYBSwWC-4vmmEQXx0ElyzEg6qaWD0km';

  Future<Map<String, dynamic>> getEvents() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?category=festivals,concerts,performing-arts'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }
}
