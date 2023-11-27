import 'dart:convert';
import 'package:fakestore/src/data/mapper/CategoryMapper.dart';
import 'package:fakestore/src/data/mapper/ProductMapper.dart';
import 'package:http/http.dart' as http;

class CategoriesRemoteDataSource {
  final String _baseUrl = "https://fakestoreapi.com/products";

  Future<List<CategoryMapper>> getAllCategoriessFromApi() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories'));
    if (response.statusCode == 200) {
      List<dynamic> CategoriesList = json.decode(response.body);
      return CategoriesList.map((json) => CategoryMapper.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Categoriess');
    }
  }
  
}