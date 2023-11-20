import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/presentation/pages/cart_page.dart';
import 'package:fakestore/src/presentation/pages/shop_page.dart';
import 'package:fakestore/src/presentation/widgets/bottoms/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //navegacion entre pestallas
  int _selectedIndex = 0;
  void navigateBottomBar (int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //paginas 
  final List<Widget> _pages=[
    //tienda pagina
    const ShopPage(),
    //carrito pagina
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context)=>IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,size: 30,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: Icon(Icons.account_circle, color: Colors.black,size: 30,))
      ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
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
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MybottomNavBar(
        onTabChange: (index)=> navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}