
import 'package:fakestore/src/domain/entities/product/Product.dart';

// ignore: camel_case_types
abstract class productGateway {
  Future<Product> getByID(String id);
  Future<List<Product>> getAll();
  
}