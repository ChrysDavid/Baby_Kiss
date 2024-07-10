import 'dart:convert';
import 'package:babikiss/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=100';
    final response = await http.get(Uri.parse(url));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
