import 'package:fakestore/src/data/datasources/CategoryRemote.dart';
import 'package:fakestore/src/domain/entities/gateway/category_gateway.dart';

import '../../domain/entities/product/Category.dart';


class CategoryRepositoryImpl implements CategoryGateway {
  final CategoriesRemoteDataSource dataSource;

  CategoryRepositoryImpl(this.dataSource);
  @override
  Future<List<Category>> getAll() async {
    var productMappers = await dataSource.getAllCategoriessFromApi();
    return productMappers.map((mapper) => Category(
      name: mapper.name,
    )).toList();
  }
}