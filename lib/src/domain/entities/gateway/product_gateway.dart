
import 'package:fakestore/src/domain/entities/product/Product.dart';

abstract class productGateway {
  Future<Product> getByID(String id);
  Future<List<Product>> getAll();
}