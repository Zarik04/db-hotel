import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/providers/hotel_provider.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:flutter_hotel_reservation_system/widget_items/hotel_card_list.dart';
import 'package:flutter_hotel_reservation_system/widget_items/room_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {

  // static const roomTypes = [
  //   RoomTypeCard(
  //     'Two-Bedroom Apartment',
  //     'Bedroom 1: 1 large double bed\nBedroom 2: 2 single beds',
  //     [
  //       'img/room1.jpg',
  //       'img/roomw2.jpg',
  //       'img/room3.jpeg',
  //       'img/hotel4.jpg',
  //     ],
  //     '4+',
  //   ),
  //   RoomTypeCard(
  //     'Budget Twin Room with Shared Bathroom and Kitchen',
  //     '2 single beds',
  //     [
  //       'img/room11.jpg',
  //       'img/room3.jpeg',
  //       'img/room1.jpg',
  //       'img/roomw2.jpg',
  //     ],
  //     '2',
  //   ),
  //   RoomTypeCard(
  //     'Budget Double Room with Shared Bathroom and Kitchen',
  //     '2 single beds',
  //     [
  //       'img/room44.jpg',
  //       'img/room44.jpg',
  //       'img/room1.jpg',
  //       'img/hotel4.jpg',
  //     ],
  //     '2',
  //   )
  // ];


  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Hotel> hotels = [];

    List<Hotel> tempHotels = Provider.of<HotelProvider>(context).hotels;

    // for (var hotel in tempHotels) {
    //   print('Chain ID: ${hotel.chainID} Hotel ID: ${hotel.hotelID} Hotel Name: ${hotel.name}');
    // }

    for (int i=0; i<tempHotels.length; i++){
      Hotel hotel = tempHotels[i];
      hotel.imageUrl = 'img/hotel${i+1}.jpg';
      hotel.description = 'Sample Description';
      // hotel.rooms = roomTypes;
      hotel.rating = 4.5;
      hotels.add(hotel);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Set menu icon color to white
      ),
      body: HotelCardList(hotels: hotels),
      drawer: const DrawerMenu(),
    );
  }
}