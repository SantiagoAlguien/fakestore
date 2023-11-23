import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/presentation/pages/cart_page.dart';
import 'package:fakestore/src/presentation/pages/shop_page.dart';
import 'package:fakestore/src/presentation/widgets/bottoms/bottom_nav_bar.dart';
import 'package:fakestore/src/presentation/widgets/bottoms/drawerLateral.dart';
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
        title: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.black,),
                ),
              ),
            ),
          ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context)=>IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,size: 30,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,size: 30,))
      ],
      ),
      drawer: const DrawerLateral(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MybottomNavBar(
        onTabChange: (index)=> navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

