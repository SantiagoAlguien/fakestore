import 'package:fakestore/src/domain/entities/product/Category.dart';

class CategoryMapper extends Category{
  CategoryMapper({required this.name}) : super(name: '');
  String name;
  // Método para construir un objeto Category desde un JSON (String)
   factory CategoryMapper.fromJson(String json) {
    return CategoryMapper(name: json);
  }
}