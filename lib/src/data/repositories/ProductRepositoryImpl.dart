import 'package:fakestore/src/data/mapper/ProductMapper.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';
import 'package:fakestore/src/domain/entities/gateway/product_gateway.dart';
import 'package:fakestore/src/data/datasources/ProductRemoteDataSource.dart';

class ProductRepositoryImpl implements productGateway {
  final ProductRemoteDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Product> getByID(String id) async {
    var productMapper = await dataSource.getProductByIdFromApi(id);
    
    return Product( // Suponiendo que Product es tu entidad de dominio
      id: productMapper.id,
      title: productMapper.title, 
      price: productMapper.price,
      category: categoryValues.reverse[productMapper.category]??"valor por defecto",
      description: productMapper.description,
      image: productMapper.image
    );
  }

  @override
  Future<List<Product>> getAll() async {
    var productMappers = await dataSource.getAllProductsFromApi();
    return productMappers.map((mapper) => Product(
      id: mapper.id,
      title: mapper.title,
      price: mapper.price,
      category: categoryValues.reverse[mapper.category]??"valor por defecto",
      description: mapper.description, 
      image: mapper.image
    )).toList();
  }
}
