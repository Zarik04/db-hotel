import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_hotel_reservation_system/screens/booking_detail.dart';
import 'package:flutter_hotel_reservation_system/screens/payment_process.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelPage(
        hotelName: 'Sample Hotel',
        image: 'img/hotel_image.jpg',
      ),
    );
  }
}

class HotelPage extends StatelessWidget {
  final String hotelName;
  final String image;

  HotelPage({required this.hotelName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotelName,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color:Colors.white),
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Description of the hotel goes here. Provide information about the amenities, location, etc.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 16.0),
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
                Text(
                  'Accommodation Types',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoomTypeCard extends StatelessWidget {
  final String type;
  final String description;
  final List<String> images;
  final String guests;

  RoomTypeCard(this.type, this.description, this.images, this.guests);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 150.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Number of guests: $guests',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _handleShowPricesClick(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Show Prices', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    _handleProceedToPayment(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: Size(200, 50), // Set the width and height as per your requirement
                  ),
                  child: Text('Proceed to Payment', style: TextStyle(color: Colors.white)),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleShowPricesClick(BuildContext context) {
    final Random random = Random();
    final double randomPrice = random.nextDouble() * 100.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Prices'),
          content: Text(
              'The Price of the room: \$${randomPrice.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _handleProceedToPayment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentScreen(roomType: type, roomImages: images),
      ),
    );
  }
}

