
import 'package:fakestore/src/domain/gateway/user_gateway.dart';
import 'package:fakestore/src/domain/entities/user/User.dart';

class LoginUseCase {
  final AuthGateway _gateway;

  LoginUseCase(this._gateway);

  Future<User> loginAuth(String email, String password) async {
    return _gateway.login(email, password);
  }
}
