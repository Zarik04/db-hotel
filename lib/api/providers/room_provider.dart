import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class RoomProvider with ChangeNotifier {
  List<Rooms> _rooms = [];

  List<Rooms> get rooms {
    return [..._rooms];
  }

  Future<void> fetchRooms(String chainId, String hotelId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('userToken');

      var uri = Uri.http('127.0.0.1:8000','hotels/rooms/$chainId/$hotelId/');
      var response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
      );

      final List<Rooms> loadedRooms = [];

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        print(json);

        for (var element in json) {
          var room = Rooms.fromJson(element);
          var res = await http.get(
            Uri.http('127.0.0.1:8000','hotels/rooms/types/${room.typeID}/'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Token $userToken',
            },
          );
          var resJson = jsonDecode(res.body);
          print(resJson);
          loadedRooms.add(room);
        }
      } else {
        print(response.statusCode);
      }
      _rooms = loadedRooms;
      notifyListeners();
    } catch (e) {
      print('Caught error: $e');
    }
  }

  void clean() {
    _rooms = [];
    notifyListeners();
  }
}
