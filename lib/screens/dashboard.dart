import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:flutter_hotel_reservation_system/widget_items/hotel_card_list.dart';
import 'package:flutter_hotel_reservation_system/widget_items/room_card.dart';

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

  static const roomTypes = [
    RoomTypeCard(
      'Two-Bedroom Apartment',
      'Bedroom 1: 1 large double bed\nBedroom 2: 2 single beds',
      [
        'img/room1.jpg',
        'img/roomw2.jpg',
        'img/room3.jpeg',
        'img/hotel4.jpg',
      ],
      '4+',
    ),
    RoomTypeCard(
      'Budget Twin Room with Shared Bathroom and Kitchen',
      '2 single beds',
      [
        'img/room11.jpg',
        'img/room3.jpeg',
        'img/room1.jpg',
        'img/roomw2.jpg',
      ],
      '2',
    ),
    RoomTypeCard(
      'Budget Double Room with Shared Bathroom and Kitchen',
      '2 single beds',
      [
        'img/room44.jpg',
        'img/room44.jpg',
        'img/room1.jpg',
        'img/hotel4.jpg',
      ],
      '2',
    )
  ];

  static List<Hotel> hotels = [
    Hotel(
      name: 'The Plaza Hotel',
      imageUrl: 'img/hotel8.jpg',
      rating: 4.9,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' New York City',
    ),
    Hotel(
      name: 'Grand Lisboa',
      imageUrl: 'img/hotel2.jpg',
      rating: 4.2,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' Macau',
    ),
    Hotel(
      name: 'Hilton Worldwide',
      imageUrl: 'img/hotel3.jpg',
      rating: 4.0,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' New York City',
    ),
    Hotel(
      name: 'Grand Hyatt',
      imageUrl: 'img/hotel4.jpg',
      rating: 3.8,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' Dubai',
    ),
    Hotel(
      name: 'InterContinental',
      imageUrl: 'img/hotel5.jpg',
      rating: 4.7,
      description: 'Sample Description',
      rooms: roomTypes,
      location: 'Lusaka',
    ),
    Hotel(
      name: 'Premier Best Western',
      imageUrl: 'img/hotel6.jpg',
      rating: 4.2,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' Florida',
    ),
    Hotel(
      name: 'The Ritz-Carlton',
      imageUrl: 'img/hotel7.jpg',
      rating: 4.6,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' Vienna',
      
    ),
    Hotel(
      name: 'The Fullerton Hotel',
      imageUrl: 'img/hotel1.jpg',
      rating: 3.9,
      description: 'Sample Description',
      rooms: roomTypes,
      location: ' Singapore',
    ),
  ];

  const DashboardPage({super.key});

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