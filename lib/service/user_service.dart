import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:test_provider_2/models/user.dart';

const _baseUrl = 'https://jsonplaceholder.typicode.com';

class ApiService {
  //делает запрос к АПИ и достает оттуда юзеров
  Future<List<Users>> fetchHero() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));
    final jsonResponse = convert.jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return jsonResponse
          .whereType<Map<String, Object?>>()
          .map(Users.fromJson)
          .toList();
    }
    if (response.statusCode == 404) {
      throw Exception('Error');
    }
    throw Exception();
  }
}
