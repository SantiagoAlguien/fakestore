import 'package:fakestore/src/domain/entities/product/Category.dart';

abstract class CategoryGateway {  
  Future<List<Category>> getAll();
}