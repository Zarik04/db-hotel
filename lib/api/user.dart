import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  static Future<Map<String, dynamic>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    if (userToken != null) {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/user/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load user data');
      }
    } else {
      throw Exception('No user token found');
    }
  }

}
