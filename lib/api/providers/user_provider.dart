import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  Guest? _user;

  Guest get user => _user!;

  Future<void> fetchAndSetUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/user/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $userToken',
      },
    );

    _user = Guest.fromJson(json.decode(response.body));
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

}
