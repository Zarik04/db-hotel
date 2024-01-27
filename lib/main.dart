import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/providers/hotel_provider.dart';
import 'package:flutter_hotel_reservation_system/api/providers/reservations_provider.dart';
import 'package:flutter_hotel_reservation_system/api/providers/room_provider.dart';
import 'package:flutter_hotel_reservation_system/api/providers/user_provider.dart';
import 'package:flutter_hotel_reservation_system/screens/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => HotelProvider()),
        ChangeNotifierProvider(create: (context) => RoomProvider()),
        ChangeNotifierProvider(create: (context) => ReservationsProvider()),
      ],
      child: const HomeApp(),
    ),
  );
}


class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:IntroPage(),
    );
  }
}