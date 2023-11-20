import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("hola mundo")
      ],
    );
  }
}