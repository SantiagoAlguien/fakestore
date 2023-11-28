import 'package:fakestore/src/domain/entities/user/User.dart';

abstract class AuthGateway {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String username, String phone);
}