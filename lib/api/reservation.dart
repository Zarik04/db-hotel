import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReservationAPI {
  static const String _apiUrl = 'http://127.0.0.1:8000/reservations/';

  static Future<Map<String, dynamic>> makePayment(
      Map<String, dynamic> paymentData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    try {
      final response = await http.post(
        Uri.parse('${_apiUrl}payments/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
        body: jsonEncode(paymentData),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Parse the JSON response and return it as a Map.
        return jsonDecode(response.body);
      } else {
        // If the request was not successful, throw an exception.
        throw Exception(
            'Failed to make a payment. Status code: ${response.statusCode}\n'
            'body: ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to make a payment. Error: $error');
    }
  }

  static Future<Map<String, dynamic>> makeReservation(
      Map<String, dynamic> reservationData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
        body: jsonEncode(reservationData),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Parse the JSON response and return it as a Map.
        return jsonDecode(response.body);
      } else {
        // If the request was not successful, throw an exception.
        throw Exception(
            'Failed to make a reservation. Status code: ${response.statusCode}\n'
            'body: ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to make a reservation. Error: $error');
    }
  }
}
