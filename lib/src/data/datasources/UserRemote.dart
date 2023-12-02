import 'dart:convert';
import 'package:fakestore/src/data/mapper/UserMapper.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource  {
  final String _baseUrl = "https://fakestoreapi.com";

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username':username,
        'password':password,
      })
    );
    if (response.statusCode == 200) {
      
      return response.body;
    }else{
      throw Exception(response.body);
    }
  }

  Future<UserMapper> register(
      String email,
      String username,
      String password,
      String firstName,
      String lastName,
      String city,
      String street,
      int number,
      String zipcode,
      String lat,
      String long,
      String phone,
  )async{
    final response = await http.post(
      Uri.parse('$_baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'username': username,
        'password': password,
        'name': {
          'firstname': firstName,
          'lastname': lastName,
        },
        'address': {
          'city': city,
          'street': street,
          'number': number,
          'zipcode': zipcode,
          'geolocation': {
            'lat': lat,
            'long': long,
          }
        },
        'phone': phone,
      }),
    );
    if (response.statusCode == 200) {
      return UserMapper.fromJson(json.decode(response.body));
    }else {
      // Si la llamada no fue exitosa, lanza una excepción
      throw Exception('Failed to register');
    }
  }
}