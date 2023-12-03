import 'package:fakestore/src/presentation/pages/home_page.dart';
import 'package:fakestore/src/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerLateral extends StatelessWidget {
  const DrawerLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
            //logo
          DrawerHeader(
            child: Image.asset('lib/assets/klipartz.com.png',)
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0), child: Divider(color: Colors.grey[800],),),
          MaterialButton(
            onPressed: ()=> Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const HomePage()
              ),
            ),
            child: const Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),child: ListTile(
              leading: Icon(Icons.home, color: Colors.black,),title: Text("Inicio", style: TextStyle(color: Colors.black),),),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: const Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),child: ListTile(
              leading: Icon(Icons.info, color: Colors.black,),title: Text("Informacion", style: TextStyle(color: Colors.black),),),
            ),
          ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
            leading: const Icon(Icons.logout, color: Colors.black,),
            title: const Text("Cerrar app", style: TextStyle(color: Colors.black),),
            onTap: ()async{
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()), 
              );
            },
            ),
          )
        ],
      ),
    );
  }
}