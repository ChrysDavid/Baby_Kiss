import 'dart:convert';
import 'package:babikiss/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=100';
    
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final results = json['results'] as List<dynamic>;

        final users = results.map((e) {
          return User.fromMap(e);
        }).toList();

        return users;
      } else {
        throw Exception('Failed to load users, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching users: $e');
      throw Exception('Error fetching users: $e');
    }
  }
}
