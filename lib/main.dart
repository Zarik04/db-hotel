import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/intro_page.dart';

void main(){
  runApp(const HomeApp());
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