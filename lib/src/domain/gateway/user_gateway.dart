import 'package:fakestore/src/domain/entities/user/User.dart';

abstract class AuthGateway {
  Future<User> login(String username, String password);
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
    );
}