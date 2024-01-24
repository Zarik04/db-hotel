import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  final String hotelName;
  final String image;

  HotelPage({required this.hotelName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hotelName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 500.0,
                  width: 1000,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Description of the hotel goes here. Provide information about the amenities, location, etc.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Accommodation Types',
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    RoomTypeCard(
                      'Two-Bedroom Apartment',
                      'Bedroom 1: 1 large double bed\nBedroom 2: 2 single beds',
                      [
                        'img/hotel1.jpg',
                        'img/hotel2.jpg',
                        'img/hotel3.jpg',
                        'img/hotel4.jpg',
                      ],
                      '4+',
                      'Show prices',
                    ),
                    RoomTypeCard(
                      'Budget Twin Room with Shared Bathroom and Kitchen',
                      '2 single beds',
                      [
                        'img/hotel1.jpg',
                        'img/hotel2.jpg',
                        'img/hotel3.jpg',
                        'img/hotel4.jpg',
                      ],
                      '2',
                      'Show prices',
                    ),
                    RoomTypeCard(
                      'Budget Double Room with Shared Bathroom and Kitchen',
                      '2 single beds',
                      [
                        'img/hotel1.jpg',
                        'img/hotel2.jpg',
                        'img/hotel3.jpg',
                        'img/hotel4.jpg',
                      ],
                      '2',
                      'Show prices',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomTypeCard extends StatelessWidget {
  final String type;
  final String description;
  final List<String> images;
  final String guests;
  final String priceButtonText;

  RoomTypeCard(
    this.type,
    this.description,
    this.images,
    this.guests,
    this.priceButtonText,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            Text(
              description,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 12.0),
            Container(
              height: 120.0,
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
            SizedBox(height: 12.0),
            Text(
              'Number of guests: $guests',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 12.0),
            GestureDetector(
              onTap: () {
                _handleShowPricesClick(context);
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  priceButtonText,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleShowPricesClick(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Prices'),
          content: Text('Prices for $type'),
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
}
