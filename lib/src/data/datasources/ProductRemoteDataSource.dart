import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fakestore/src/domain/entities/product/Product.dart';

class ProductRemoteDataSource {
  final String _baseUrl = "https://fakestoreapi.com";

  Future<Product> getProductByIdFromApi(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> getAllProductsFromApi() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      List<dynamic> productList = json.decode(response.body);
      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
