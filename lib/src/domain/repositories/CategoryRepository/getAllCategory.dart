  import 'package:fakestore/src/domain/gateway/category_gateway.dart';
  import 'package:fakestore/src/domain/entities/product/Category.dart';

class GetCategoryUserCase  {
    final CategoryGateway _categoryGateway;
    GetCategoryUserCase(this._categoryGateway);

    Future<List<Category>>getAll() async{
      return _categoryGateway.getAll() ;
    }
  }