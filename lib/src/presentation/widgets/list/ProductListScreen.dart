// ignore_for_file: must_call_super

import 'package:fakestore/src/data/datasources/ProductRemote.dart';
import 'package:fakestore/src/data/repositories/ProductImpl.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';
import 'package:fakestore/src/domain/repositories/ProductRepository/getAllProducts.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> products;
  late GetProductUserCase getProductUserCase;

  @override
  void initState() {
  final String _sortResults = "desc";
  // Crea una instancia de ProductRemoteDataSource
  var productRemoteDataSource = ProductRemoteDataSource(_sortResults);

  // Crea una instancia de ProductRepositoryImpl con productRemoteDataSource
  var productRepository = ProductRepositoryImpl(productRemoteDataSource);

  // Ahora utiliza productRepository para crear GetProductUserCase
  getProductUserCase = GetProductUserCase(productRepository);

  // Llama a getAll para obtener los productos
  products = getProductUserCase.getAll();
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles'));
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 150,
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Container(
                          child: Image.network(snapshot.data![index].image, height:100 ,width: 100,),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                        child: Column(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text(
                              snapshot.data![index].title,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,                            
                            ),
                            SizedBox(height: 5,),
                            Text("\$ " + snapshot.data![index].price.toString(), 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                            ),
                            Text("Envio gratis", style: TextStyle(color: Colors.green),),
                            SizedBox(height: 20,),
                          ],
                        ),
                      )
                      ],
                    ),
                  ),
                
              // return ListTile(
              //   title: MaterialButton(
              //     onPressed: () {},
              //     child: Column(
              //       children: [
              //         Text(snapshot.data![index].title),
              //         Image.network(snapshot.data![index].image, width: 100, height: 100,),
              //       ],
              //     )
              //   ),
              //   subtitle: Text("\$ "+snapshot.data![index].price.toString()),
              // );
          );},
          );
        },
      ),
    );
  }
}