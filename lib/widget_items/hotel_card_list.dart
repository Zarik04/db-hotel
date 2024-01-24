import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/hotels_details.dart';
import 'package:flutter_hotel_reservation_system/widget_items/hotel_card_view.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';

class HotelCardList extends StatelessWidget {
  final List<Hotel> hotels;

  const HotelCardList({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HotelPage(
                          hotelName: hotels[index].name,
                          image: hotels[index].imageUrl,
                        )));

            print('Clicked on ${hotels[index].name}');
          },
          child: HotelCard(hotel: hotels[index]),
        );
      },
    );
  }
}
