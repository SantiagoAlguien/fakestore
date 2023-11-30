
import 'package:fakestore/src/data/datasources/UserRemote.dart';
import 'package:fakestore/src/data/repositories/AuthRepositoryImpl.dart';
import 'package:fakestore/src/domain/entities/user/User.dart';
import 'package:fakestore/src/domain/repositories/UserRepository/postLogin.dart';
import 'package:fakestore/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late LoginUserCase loginUserCase;
  Future<User>? loggedInUser;
  

  @override
  void initState() {
    super.initState();
    var userRemoteDataSource = AuthRemoteDataSource();
    var userRepository = AuthRepositoryImpl(userRemoteDataSource);
    loginUserCase = LoginUserCase(userRepository);
    
  }


  Future<void> _login() async {
    try {
      final user = await loginUserCase.loginAuth(
        usernameController.text,
        passwordController.text,
      );
      // Navegación a la página principal después del login exitoso
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()), // Reemplaza con tu HomePage
      );
    } catch (e) { 
      // Manejo de errores
      print("Error en el login: ${e.toString()}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            FutureBuilder<User>(
              future: loggedInUser,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  // Manejo después del login exitoso
                  return Text('Login exitoso: ${snapshot.data!.username}');
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
