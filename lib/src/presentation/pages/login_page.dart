import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/data/datasources/UserRemote.dart';
import 'package:fakestore/src/data/repositories/AuthRepositoryImpl.dart';
import 'package:fakestore/src/domain/entities/user/User.dart';
import 'package:fakestore/src/domain/repositories/UserRepository/postLogin.dart';
import 'package:fakestore/src/presentation/pages/home_page.dart';
import 'package:fakestore/src/presentation/pages/registrationPage.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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

  bool _passwordVisible = false;

  Future<void> _login() async {
  try {
    final user = await loginUserCase.loginAuth(
      usernameController.text,
      passwordController.text,
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
    setState(() {
      loggedInUser = Future.value(user);
    });
  } catch (e) {
    // Manejo de errores
      showTopSnackBar(context, 'Error en el inicio de sesión: ${e.toString()}');
    
    }
  }
  // Funcion para mostrar la notificacion de error
 static void showTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50, // Posición desde la parte superior
      left: 10,
      right: 10,
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          
          padding: EdgeInsets.all(10),
          color: Colors.red,
          child: Column(
            
            children: <Widget>[
              Text(
                'Error',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                ' Ingresa con las crendenciales ',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Username: mor_2314',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Password: 83r5^_',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay!.insert(overlayEntry);

  // Opcional: Cierra el overlay después de un tiempo
  Future.delayed(Duration(seconds: 4), () {
    overlayEntry.remove();
  });
}




  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width; 
    double imagesize = widthMedia*0.6;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(        
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // texto de saludo al usuario
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: imagesize,
                    height: imagesize,
                    child: Image.asset('lib/assets/klipartz.com.png'),
                  ),
                ),
                Text(
                  'Hola puedes ingresar!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Bienvenido a la mejor tienda online',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 40,),
                // username texfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                          controller: usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombre de usuario'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // password texfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: !_passwordVisible, // Usa la variable para controlar la visibilidad
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Cambia el ícono dependiendo de si la contraseña está visible o no
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              // Cambia el estado para mostrar u ocultar la contraseña
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                //sign in button
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 25.0),
                  child: MaterialButton(
                    onPressed: _login,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No estas registrado?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegistrationPage()));
                      },
                      child: Text(
                        'Registrate ahora',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    FutureBuilder<User>(
                      future: loggedInUser,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return Text('Login exitoso');
                        }
                        return Container();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}