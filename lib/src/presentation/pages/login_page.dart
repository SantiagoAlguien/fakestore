
import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo 
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('lib/assets/klipartz.com.png', height: 240,)
              ),
              const SizedBox(height: 24,),
              // titulo 
              const Text("El mejor cafe", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              const SizedBox(height: 24,),
              //sub titulo 
              const Text("Descripcion mamalona porque no tengo ideas", style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48,),
              //boton de inicio
              MaterialButton(
                onPressed: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => HomePage()))
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      "Ingresar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}