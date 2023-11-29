// To parse this JSON data, do
//
//     final userMapper = userMapperFromJson(jsonString);

import 'dart:convert';

UserMapper userMapperFromJson(String str) => UserMapper.fromJson(json.decode(str));

String userMapperToJson(UserMapper data) => json.encode(data.toJson());

class UserMapper {
    String email;
    String username;
    String password;
    Name name;
    Address address;
    String phone;

    UserMapper({
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.address,
        required this.phone,
    });

    factory UserMapper.fromJson(Map<String, dynamic> json) => UserMapper(
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
    };
}

class Address {
    String city;
    String street;
    int number;
    String zipcode;
    Geolocation geolocation;

    Address({
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
        required this.geolocation,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: Geolocation.fromJson(json["geolocation"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
        "geolocation": geolocation.toJson(),
    };
}

class Geolocation {
    String lat;
    String long;

    Geolocation({
        required this.lat,
        required this.long,
    });

    factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"],
        long: json["long"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}

class Name {
    String firstname;
    String lastname;

    Name({
        required this.firstname,
        required this.lastname,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
    };
}
