
import 'package:fakestore/src/domain/entities/user/User.dart';
import 'package:fakestore/src/domain/gateway/user_gateway.dart';

class RegistrerUserCase {
  final AuthGateway _gateway;

  RegistrerUserCase(this._gateway);

  Future<User> loginAuth(String email, String password, String username, String phone) async {
    return _gateway.register(email, password, username, phone);
  }
}