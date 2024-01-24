import 'package:flutter_hotel_reservation_system/widget_items/room_card.dart';

class Hotel {
  final String name;
  final String imageUrl;
  final double rating;
  final String description;
  final List<RoomTypeCard> rooms;
  final String location;

  Hotel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.rooms,
    required this.location,
  });
}