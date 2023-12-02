import 'package:fakestore/src/data/datasources/UserRemote.dart';
import 'package:fakestore/src/domain/entities/user/User.dart';
import 'package:fakestore/src/domain/gateway/user_gateway.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class AuthRepositoryImpl implements AuthGateway {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

@override
  Future<User> login(String username, String password) async {
    try {
      final responseString = await dataSource.login(username, password);
      var data = json.decode(responseString);

      // Suponiendo que el token está en la respuesta
      String token = data['token'];
      await _saveToken(token);

      // Continúa con la creación y devolución del objeto User
      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }

  
  @override
  Future<User> register(
      String email,
      String username,
      String password,
      String phone,
      String firstName,
      String lastName,
      String city,
      String street,
      int number,
      String zipcode,
      String lat,
      String long,
    ) async{
    var userMapper = await dataSource.register(
      email, 
      username, 
      password, 
      phone, 
      firstName, 
      lastName, 
      city, 
      street as int, 
      number as String, 
      zipcode, 
      lat, 
      long
    );
    return User(
      id: userMapper.id,
      email: userMapper.email,
      password: userMapper.password,
      username: userMapper.username,
      phone: userMapper.phone,
      name: Name(
        firstname: userMapper.name.firstname, 
        lastname: userMapper.name.lastname
      ),
      address: Address(
        city: userMapper.address.city, 
        street: userMapper.address.street, 
        number: userMapper.address.number, 
        zipcode: userMapper.address.zipcode, 
        geolocation: Geolocation(lat: userMapper.address.geolocation.lat, long: userMapper.address.geolocation.long)
        )
      );
  }

}
