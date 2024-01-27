import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/reservation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReservationsProvider with ChangeNotifier {
  List<Reservation> _reservations = [];

  List<Reservation> get reservations {
    return [..._reservations];
  }

  Future<void> fetchReservations(String guestId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    final response = await http.get(
      Uri.http('127.0.0.1:8000', 'reservations/guest/$guestId/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $userToken',
      },
    );

    final List<Reservation> loadedReservations = [];

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      // print(json);
      for (var element in json) {
        Reservation reservation = Reservation();
        reservation.checkInDate = element['check_in_date'];
        var hotel_res = await http.get(
          Uri.http('127.0.0.1:8000',
              'hotels/${element['chain_id']}/${element['hotel_id']}/'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $userToken',
          },
        );
        var hotel = jsonDecode(hotel_res.body);
        reservation.hotelName = hotel['hotel_name'];
        reservation.roomNumber = element['room_no'];

        var room_res = await http.get(
          Uri.http('127.0.0.1:8000',
              'hotels/rooms/${element['chain_id']}/${element['hotel_id']}/${element['room_no']}/'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $userToken',
          },
        );
        var room_type_res = await http.get(
          Uri.http('127.0.0.1:8000',
              'hotels/rooms/types/${jsonDecode(room_res.body)['type_id']}/'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $userToken',
          },
        );

        var room_type = jsonDecode(room_type_res.body);

        reservation.description = room_type['description'];
        reservation.roomType = room_type['room_type'];
        reservation.price = room_type['price'];

        // print('hotel: ${reservation.hotelName}\n'
        //     'room_no: ${reservation.roomNumber}\n'
        //     'type: ${reservation.roomType}\n'
        //     'description: ${reservation.description}\n'
        //     'price: ${reservation.price}\n');
        loadedReservations.add(reservation);
      }
    } else {
      print(response.statusCode);
    }

    // Parse the response and add the hotels to loadedHotels
    _reservations = loadedReservations;
    notifyListeners();
  }

  void clean() {
    _reservations = [];
    notifyListeners();
  }
}
