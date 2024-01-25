import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/providers/room_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelProvider with ChangeNotifier {
  List<Hotel> _hotels = [];

  List<Hotel> get hotels {
    return [..._hotels];
  }

  Future<void> fetchHotels() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/hotels/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $userToken',
      },
    );

    final List<Hotel> loadedHotels = [];

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);

      for (var element in json) {
        // print(element);
        var hotel = Hotel.fromJson(element);
        var res = await http.get(
          Uri.parse(
              'http://127.0.0.1:8000/hotels/locations/${hotel.locationID}/'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $userToken',
          },
        );

        var res_json = jsonDecode(res.body);
        hotel.location =
            '${res_json['address']}, ${res_json['city']}, ${res_json['state']}';
        loadedHotels.add(hotel);
      }
    } else {
      print(response.statusCode);
    }

    // Parse the response and add the hotels to loadedHotels
    _hotels = loadedHotels;
    notifyListeners();
  }

  void clean() {
    _hotels = [];
    notifyListeners();
  }
}
