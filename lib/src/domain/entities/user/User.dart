
class User {
  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int? ?? 0, // Valor por defecto para int
      email: json['email'] as String? ?? '', // Valor por defecto para String
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: Name.fromJSON(json['name'] as Map<String, dynamic>? ?? {}), // Asume que Name tiene un fromJSON
      address: Address.fromJSON(json['address'] as Map<String, dynamic>? ?? {}),
      phone: json['phone'] as String? ?? '',
    );
  }
  int id;
  String email;
  String username;
  String password;
  Name name;
  Address address;
  String phone;
  
}

class Name {
  final String firstname;
  final String lastname;
  factory Name.fromJSON(Map<String, dynamic> json) {
    return Name(
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
    );
  }
  Name({
    required this.firstname,
    required this.lastname,
  });
}

class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final Geolocation geolocation;
  factory Address.fromJSON(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String? ?? '',
      street: json['street'] as String? ?? '',
      number: json['number'] as int? ?? 0,
      zipcode: json['zipcode'] as String? ?? '',
      geolocation: Geolocation.fromJSON(json['geolocation'] as Map<String, dynamic>? ?? {}),
    );
  }
  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });
}

class Geolocation {
  final String lat;
  final String long;

  factory Geolocation.fromJSON(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat'] as String? ?? '',
      long: json['long'] as String? ?? '',
      
    );
  }  
  Geolocation({
    required this.lat,
    required this.long,
  });
}
