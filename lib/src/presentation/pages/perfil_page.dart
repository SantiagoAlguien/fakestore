import 'package:fakestore/cosnt.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Controladores para los campos de texto
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text('Perfil de mor_2314'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          _buildProfileImage(),
          
          
          SizedBox(height: 10),
          _buildEditProfileButton(),
          SizedBox(height: 10),
          _buildSignOutButton(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage('https://cdn.icon-icons.com/icons2/2574/PNG/512/profile_picture_user_icon_153847.png'), // Reemplaza con tu URL de imagen
    );
  }


  

  Widget _buildEditProfileButton() {
    return _buildCustomButton('Editar Perfil', () {
      // Lógica para editar el perfil
    });
  }

  Widget _buildSignOutButton() {
    return _buildCustomButton('Cerrar Sesión', () {
      // Lógica para cerrar sesión
    });
  }

  Widget _buildCustomButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
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
