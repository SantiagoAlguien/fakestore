  import 'package:fakestore/src/domain/entities/gateway/product_gateway.dart';
  import 'package:fakestore/src/domain/entities/product/Product.dart';

class GetProductUserCase  {
    final productGateway _productGateway;
    GetProductUserCase(this._productGateway);
    Future<Product> getProducById (String id) async{
      return this._productGateway.getByID(id);
    }
    Future<List<Product>> getAll () async{
      return this._productGateway.getAll();
    }
  }