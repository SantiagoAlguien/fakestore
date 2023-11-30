import 'package:fakestore/src/presentation/pages/home_page.dart';
import 'package:fakestore/src/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _checkToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return HomePage(); // La página principal si el usuario ya inició sesión
            } else {
              return LoginPage(); // La página de login si no hay token
            }
          }
          return CircularProgressIndicator(); // Mientras se espera la respuesta
        },
      ),
    );
  }
}

  Future<bool> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('jwt_token') ?? '';
    return token.isNotEmpty;
  }