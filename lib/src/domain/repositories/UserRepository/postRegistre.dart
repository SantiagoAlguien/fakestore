
import 'package:fakestore/src/domain/entities/user/User.dart';
import 'package:fakestore/src/domain/gateway/user_gateway.dart';

class RegistrerUserCase {
  final AuthGateway _gateway;

  RegistrerUserCase(this._gateway);

  Future<User> loginAuth(
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
  ) async {
    return _gateway.register(
      email, 
      username, 
      password, 
      phone, 
      firstName, 
      lastName, 
      city, 
      street , 
      number , 
      zipcode, 
      lat, 
      long
    );
  }
}