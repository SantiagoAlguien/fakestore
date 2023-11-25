import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/data/datasources/ProductRemote.dart';
import 'package:fakestore/src/data/repositories/ProductImpl.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';
import 'package:fakestore/src/domain/repositories/ProductRepository/getAllProducts.dart';
import 'package:fakestore/src/presentation/widgets/LoadingWidget.dart';
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
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top:20),
          child: Text("Producto", style: TextStyle(color: Colors.black, fontSize: 25),)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.arrow_back_ios, color: Colors.black,size: 30,),
                  ),
                onPressed: () => Navigator.pop(context),
              );
            },
          ),
        ),
      body: FutureBuilder<Product>(
        future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return  LoadingWidget();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData ) {
              return LoadingWidget();
            }
            final product = snapshot.data!;
            double widthMedia = MediaQuery.of(context).size.width; 
            double imagesize = widthMedia*0.8;
            return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.network(
                    product.image,
                    width: imagesize,
                    height: imagesize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey, // Precio destacado
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Llega gratis ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),),
                      
                      SizedBox(height: 16),
                      Text(
                        "Ultima disponible!!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 16),
                      MaterialButton(
                        onPressed: () {
                          // Añadir al carrito
                        },
                        color: backgroundColor, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "Añadir al carrito",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}