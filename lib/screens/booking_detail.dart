import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/providers/reservations_provider.dart';
import 'package:flutter_hotel_reservation_system/api/providers/user_provider.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';
import 'package:provider/provider.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String roomType;
  final List<String> roomImages;
  final double amountPaid;

  const BookingDetailsScreen({
    super.key,
    required this.roomType,
    required this.roomImages,
    required this.amountPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 8.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Room Type:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    roomType,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Amount Paid:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '\$${amountPaid.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Room Images:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: roomImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(roomImages[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final Guest guest = Provider.of<UserProvider>(context, listen: false).user;
                      await Provider.of<ReservationsProvider>(context, listen: false).fetchReservations(guest.uid!);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: const Size(200,
                          50), // Set the width and height as per your requirement
                    ),
                    child: const Text('Close',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
