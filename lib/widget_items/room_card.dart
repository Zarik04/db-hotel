import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:flutter_hotel_reservation_system/screens/payment_page.dart';

class RoomTypeCard extends StatelessWidget {
  final Rooms room;

  final List<String> images;

  const RoomTypeCard(this.room, this.images,
      {super.key});

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
              room.description!,
              style:
              const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              room.roomType!,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 150.0,
                      margin: const EdgeInsets.only(right: 8.0),
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
            const SizedBox(height: 8.0),
            Text(
              'Number of guests: ${room.maxCapacity}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _handleShowPricesClick(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Show Prices',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    _handleProceedToPayment(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(200,
                        50), // Set the width and height as per your requirement
                  ),
                  child: const Text('Proceed to Payment',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleShowPricesClick(BuildContext context) {
    final double randomPrice = room.price!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Prices'),
          content: Text(
              'The Price of the room: \$${randomPrice.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
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
        builder: (context) => PaymentScreen(roomType: room.description!, roomImages: images),
      ),
    );
  }
}
