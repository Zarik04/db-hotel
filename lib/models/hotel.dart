import 'package:flutter_hotel_reservation_system/widget_items/room_card.dart';

class Hotel {
  String? chainID;
  String? hotelID;
  String? name;
  int? locationID;
  String? imageUrl;
  double? rating;
  String? description;
  List<RoomTypeCard>? rooms;
  String? location;
  String? contactNumber;
  int? numberOfRooms;
  int? maxCapacity;

  Hotel({
    this.chainID,
    this.hotelID,
    this.name,
    this.locationID,
    this.imageUrl,
    this.rating,
    this.description,
    this.rooms,
    this.location,
    this.contactNumber,
    this.numberOfRooms,
    this.maxCapacity,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      chainID: json['chain_id'],
      hotelID: json['hotel_id'],
      name: json['hotel_name'],
      locationID: json['location_id'],
      contactNumber: json['contact_number'],
      numberOfRooms: json['number_of_rooms'],
      maxCapacity: json['max_capacity'],
    );
  }

}
