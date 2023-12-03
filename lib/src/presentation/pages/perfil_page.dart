import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Controladores para los campos de texto
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Perfil de mor_2314', style: TextStyle(color: Colors.black, fontSize: 20),),
          const SizedBox(height: 20),
          _buildProfileImage(),
          const SizedBox(height: 10),
          _buildEditProfileButton(),
          const SizedBox(height: 10),
          _buildSignOutButton(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    double widthMedia = MediaQuery.of(context).size.width; 
    double imagesize = widthMedia*0.5;
    return SizedBox(
      width: imagesize,
      height: imagesize,
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage('https://cdn.icon-icons.com/icons2/2574/PNG/512/profile_picture_user_icon_153847.png'), // Reemplaza con tu URL de imagen
      ),
    );
  }


  

  Widget _buildEditProfileButton() {
    return _buildCustomButton('Editar Perfil', () {
      // Lógica para editar el perfil
    });
  }

  Widget _buildSignOutButton() {
    return _buildCustomButton('Cerrar Sesión', () async{
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()), 
      );
    });
  }

  Widget _buildCustomButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
