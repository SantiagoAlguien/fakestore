
import 'package:fakestore/src/data/repositories/ProductImpl.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';

class GetProductsByCategoryUseCase {
    final ProductRepositoryImpl _repository;

    GetProductsByCategoryUseCase(this._repository);

    Future<List<Product>> call(String category) async {
        return _repository.getProductsByCategory(category);
    }
}
