import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String roomType;
  final List<String> roomImages;
  final double amountPaid;

  BookingDetailsScreen({
    required this.roomType,
    required this.roomImages,
    required this.amountPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
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
                  Text(
                    'Room Type:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    roomType,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Amount Paid:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${amountPaid.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Room Images:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: roomImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150.0,
                          margin: EdgeInsets.only(right: 8.0),
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
                  SizedBox(height: 29,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: Size(200, 50), // Set the width and height as per your requirement
                    ),
                    child: Text('Close', style: TextStyle(color: Colors.white)),
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
