

import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerLateral extends StatelessWidget {
  const DrawerLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
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
              leading: Icon(Icons.home, color: Colors.white,),title: Text("Inicio", style: TextStyle(color: Colors.white),),),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: const Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),child: ListTile(
              leading: Icon(Icons.info, color: Colors.white,),title: Text("Informacion", style: TextStyle(color: Colors.white),),),
            ),
          ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
            leading: const Icon(Icons.logout, color: Colors.white,),
            title: const Text("Cerrar app", style: TextStyle(color: Colors.white),),
            onTap: (){
              SystemNavigator.pop();
            },
            ),
          )
        ],
      ),
    );
  }
}