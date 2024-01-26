class Rooms {
  String? chainId;
  String? hotelId;
  String? roomNo;
  int? maxCapacity;
  int? availableSpace;
  int? typeID;
  bool? availability;
  String? roomType;
  double? price;
  String? description;

  Rooms({
    this.chainId,
    this.hotelId,
    this.roomNo,
    this.maxCapacity,
    this.availableSpace,
    this.typeID,
    this.availability,
    this.roomType,
    this.price,
    this.description,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) {
    return Rooms(
      chainId: json['chain_id'],
      hotelId: json['hotel_id'],
      roomNo: json['room_no'],
      maxCapacity: json['max_capacity'],
      availableSpace: json['available_space'],
      typeID: json['type_id'],
      availability: json['availability'],
    );
  }
}
