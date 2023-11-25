import 'package:fakestore/src/data/datasources/CategoryRemote.dart';
import 'package:fakestore/src/data/datasources/ProductRemote.dart';
import 'package:fakestore/src/data/repositories/ProductImpl.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';
import 'package:fakestore/src/domain/repositories/ProductRepository/getAllProducts.dart';
import 'package:fakestore/src/presentation/pages/info_product_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductListScreen extends StatefulWidget {
  String categorie;
  ProductListScreen({super.key, required this.categorie});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> products;
  late GetProductUserCase getProductUserCase;
  
  @override
  void initState() {
  super.initState();
  
  // Crea una instancia de ProductRemoteDataSource
  var productRemoteDataSource = CategoriesRemoteDataSource(widget.categorie.toString());

  // Crea una instancia de ProductRepositoryImpl con productRemoteDataSource
  var productRepository = ProductRepositoryImpl(productRemoteDataSource as ProductRemoteDataSource);

  // Ahora utiliza productRepository para crear GetProductUserCase
  getProductUserCase = GetProductUserCase(productRepository);

  _loadProducts();
  // Llama a getAll para obtener los productos
  products = getProductUserCase.getAll();
  
  }
  
  Future<void> _loadProducts() async {
    setState(() {
      products = getProductUserCase.getAll();
    }); 
  }

  Future<void> _refreshProducts() async {
    await _loadProducts();
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return  Center(child:CircularProgressIndicator(),);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child:CircularProgressIndicator());
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  double imageSize = screenWidth * 0.2;
                  return MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => 
                          InfoProduct(
                            id: product.id.toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10)
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\$ ${product.price}", style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10),
                            const Text("Envio gratuito", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        leading: Image.network(
                          product.image,
                          height: imageSize,
                          width: imageSize,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}