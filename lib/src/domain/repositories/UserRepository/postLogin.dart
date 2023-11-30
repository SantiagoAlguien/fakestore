
import 'package:fakestore/src/domain/gateway/user_gateway.dart';
import 'package:fakestore/src/domain/entities/user/User.dart';

class LoginUserCase {
  final AuthGateway _gateway;

  LoginUserCase(this._gateway);

  Future<User> loginAuth(String username, String password) async {
    return _gateway.login(username, password);
  }

  
}
