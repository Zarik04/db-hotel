import 'dart:convert';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _apiUrl = 'http://127.0.0.1:8000/auth/';

  static Future<Map<String, dynamic>> signUpUser({required Guest user}) async {
    // Simulate the signup API endpoint.

    // Prepare the data to be sent in the request body.
    final Map<String, dynamic> signupData = user.toJson();

    try {
      // Make the POST request.
      final response = await http.post(
        Uri.parse('${_apiUrl}signup/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(signupData),
      );

      // Check if the request was successful (status code 2xx).
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Parse the JSON response and return it as a Map.
        return jsonDecode(response.body);
      } else {
        // If the request was not successful, throw an exception.
        throw Exception(
            'Failed to sign up. Status code: ${response.statusCode}\n'
            'body: ${response.body}');
      }
    } catch (error) {
      // Catch any exceptions that occurred during the request.
      throw Exception('Failed to sign up. Error: $error');
    }
  }

  static Future<Map<String, dynamic>> loginUser({required String email, required String password}) async {
    // Simulate the login API endpoint.

    // Prepare the data to be sent in the request body.
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    try {
      // Make the POST request.
      final response = await http.post(
        Uri.parse('${_apiUrl}login/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(loginData),
      );

      // Check if the request was successful (status code 2xx).
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Parse the JSON response and return it as a Map.
        return jsonDecode(response.body);
      } else {
        // If the request was not successful, throw an exception.
        throw Exception(
            'Failed to log in. Status code: ${response.statusCode}\n'
                'body: ${response.body}');
      }
    } catch (error) {
      // Catch any exceptions that occurred during the request.
      throw Exception('Failed to log in. Error: $error');
    }
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    if (userToken != null) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/auth/logout/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
      );

      if (response.statusCode == 200) {
        // Successfully logged out
        // Remove the user token from shared preferences
        await prefs.remove('userToken');
      } else {
        throw Exception('Failed to log out');
      }
    } else {
      throw Exception('No user token found');
    }
  }

}
