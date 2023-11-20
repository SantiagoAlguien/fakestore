import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MybottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MybottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[900],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.black),
        tabs: const [
          GButton(
            icon: Icons.shopping_bag,
            text: ' Tienda',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: ' Carrito',
          ),
        ],
      ),
    );
  }
}