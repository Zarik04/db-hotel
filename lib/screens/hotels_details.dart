import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';

class HotelPage extends StatelessWidget {
  final Hotel hotel;

  const HotelPage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hotel.name!,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300.0,
            child: Image.asset(
              hotel.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotel.description!,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Accommodation Types',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ...hotel.rooms!
              ],
            ),
          ),
        ],
      ),
    );
  }
}
