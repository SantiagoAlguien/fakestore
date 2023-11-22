// ignore_for_file: file_names

import 'dart:convert';
import 'package:fakestore/src/data/mapper/ProductMapper.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  final String _baseUrl = "https://fakestoreapi.com";

  Future<ProductMapper> getProductByIdFromApi(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return ProductMapper.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<ProductMapper>> getAllProductsFromApi() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      List<dynamic> productList = json.decode(response.body);
      return productList.map((json) => ProductMapper.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}