// ignore: file_names
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


class ShoppingCart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  void deleteProduct(Product product) {
    products.clear();
  }// Aquí puedes agregar más métodos según sea necesario, como eliminar productos.
}
