// ignore: file_names
import 'package:flutter/material.dart';

class Product {
Product({
  required this.id, 
  required this.title,
  required this.price,
  required this.category,
  required this.description,
  required this.image,
  });

  int id ;
  String title;
  double price;
  String category;
  String description;
  String image;
}


class ShoppingCart with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }


  // Puedes añadir más lógica según sea necesario, como eliminar un artículo, etc.
}

