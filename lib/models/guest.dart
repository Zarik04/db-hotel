class Guest {
  String? uid,
      imagePath='img/ava.jpg',
      firstName,
      lastName,
      gender,
      email,
      passportNumber,
      birthDate,
      phone,
      password,
      address,
      city,
      state,
      country,
      zipCode,
      nationality;

  Guest({
    this.uid,
    this.firstName,
    this.lastName,
    this.gender,
    // this.imagePath,
    this.email,
    this.passportNumber,
    this.birthDate,
    this.phone,
    this.password,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.nationality,
  });

  Map<String, String?> toJson() {
    return {
      'guest_id': uid,
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': birthDate,
      'gender': gender,
      'passport_no': passportNumber,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zipCode,
      'nationality': nationality,
      'phone_number': phone,
      'email': email,
      'password': password,
    };
  }

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      uid: json['guest_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: json['date_of_birth'],
      gender: json['gender'],
      passportNumber: json['passport_no'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zip_code'],
      nationality: json['nationality'],
      phone: json['phone_number'],
      email: json['email'],
      password: json['password'],
    );
  }

}
