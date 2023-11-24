import 'package:fakestore/src/data/datasources/ProductRemote.dart';
import 'package:fakestore/src/data/mapper/ProductMapper.dart';
import 'package:fakestore/src/data/repositories/ProductImpl.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';
import 'package:fakestore/src/domain/repositories/ProductRepository/getAllProducts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoProduct extends StatefulWidget {
  String id;
  InfoProduct({
    super.key, 
    required this.id,
  });

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  late Future<Product> products;
  late GetProductUserCase getProductUserCase;
  
  @override
  void initState() {
  super.initState();
  const String sortResults = "asc";
  // Crea una instancia de ProductRemoteDataSource
  var productRemoteDataSource = ProductRemoteDataSource(sortResults);

  // Crea una instancia de ProductRepositoryImpl con productRemoteDataSource
  var productRepository = ProductRepositoryImpl(productRemoteDataSource);

  // Ahora utiliza productRepository para crear GetProductUserCase
  getProductUserCase = GetProductUserCase(productRepository);

  // Llama a getAll para obtener los productos
  products = getProductUserCase.getProducById(widget.id) as Future<Product>;
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Column(
        children: [
          Text("el id del producto es "+widget.id.toString()),
          
        ],
      )),
      body: FutureBuilder<Product>(
        future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return  Center(child:CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData ) {
              return Center(child:CircularProgressIndicator(),);
            }
            final product = snapshot.data!;
            double widthMedia = MediaQuery.of(context).size.width; 
            double imagesize = widthMedia*0.5;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    product.image,
                    width: imagesize,
                    height: imagesize,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}