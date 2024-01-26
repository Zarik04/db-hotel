import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/providers/room_provider.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:flutter_hotel_reservation_system/screens/hotels_details.dart';
import 'package:flutter_hotel_reservation_system/widget_items/hotel_card_view.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:flutter_hotel_reservation_system/widget_items/room_card.dart';
import 'package:provider/provider.dart';

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
          onTap: () async {
            await Provider.of<RoomProvider>(context, listen: false)
                .fetchRooms(hotels[index].chainID!, hotels[index].hotelID!);

            List<Rooms> tempRooms = Provider.of<RoomProvider>(context, listen: false).rooms;

            List<RoomTypeCard> roomTypes = [];

            for (var room in tempRooms) {
              RoomTypeCard roomTypeCard = RoomTypeCard(
                room,
                const [
                  'img/room44.jpg',
                  'img/room44.jpg',
                  'img/room1.jpg',
                  'img/hotel4.jpg',
                ],
              );

              roomTypes.add(roomTypeCard);
            }

            hotels[index].rooms = roomTypes;

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HotelPage(hotel: hotels[index])));

            // print('Clicked on ${hotels[index].name}');
          },
          child: HotelCard(hotel: hotels[index]),
        );
      },
    );
  }
}
