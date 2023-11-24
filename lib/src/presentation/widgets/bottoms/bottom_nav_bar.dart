import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MybottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MybottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBackgroundColor: Colors.grey.shade100,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const [
          GButton(
            icon: Icons.shopping_bag,
            text: ' Tienda',
          ),
          GButton(
            icon: Icons.person,
            text: ' Perfil',
          ),
        ],
      ),
    );
  }
}