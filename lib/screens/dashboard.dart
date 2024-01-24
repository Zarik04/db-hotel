import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:flutter_hotel_reservation_system/widget_items/hotel_card_list.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  static List<Hotel> hotels = [
    Hotel(
      name: 'The Plaza Hotel',
      imageUrl: 'img/hotel8.jpg',
      rating: 4.9,
      location: ' New York City',
    ),
    Hotel(
      name: 'Grand Lisboa',
      imageUrl: 'img/hotel2.jpg',
      rating: 4.2,
      location: ' Macau',
    ),
    Hotel(
      name: 'Hilton Worldwide',
      imageUrl: 'img/hotel3.jpg',
      rating: 4.0,
      location: ' New York City',
    ),
    Hotel(
      name: 'Grand Hyatt',
      imageUrl: 'img/hotel4.jpg',
      rating: 3.8,
      location: ' Dubai',
    ),
    Hotel(
      name: 'InterContinental',
      imageUrl: 'img/hotel5.jpg',
      rating: 4.7,
      location: 'Lusaka',
    ),
    Hotel(
      name: 'Premier Best Western',
      imageUrl: 'img/hotel6.jpg',
      rating: 4.2,
      location: ' Florida',
    ),
    Hotel(
      name: 'The Ritz-Carlton',
      imageUrl: 'img/hotel7.jpg',
      rating: 4.6,
      location: ' Vienna',
      
    ),
    Hotel(
      name: 'The Fullerton Hotel',
      imageUrl: 'img/hotel1.jpg',
      rating: 3.9,
      location: ' Singapore',
    ),
  ];

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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