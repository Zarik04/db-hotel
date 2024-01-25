import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                hotel.imageUrl!,
                height: screenHeight * 0.7, // Adjust the percentage as needed
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    hotel.name!,
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rating: ${hotel.rating}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green.shade400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Location: ${hotel.location}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green.shade400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
