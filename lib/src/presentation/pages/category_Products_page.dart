import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/data/datasources/ProductRemote.dart';
import 'package:fakestore/src/data/repositories/ProductImpl.dart';
import 'package:fakestore/src/domain/entities/product/Product.dart';
import 'package:fakestore/src/domain/repositories/ProductRepository/getAllProducts.dart';
import 'package:fakestore/src/presentation/pages/info_product_page.dart';
import 'package:fakestore/src/presentation/widgets/LoadingWidget.dart';
import 'package:fakestore/src/presentation/widgets/bottoms/drawer.dart';
import 'package:fakestore/src/presentation/widgets/bottoms/drawerEnd.dart';
import 'package:flutter/material.dart';


class CategoryProductsPage extends StatefulWidget {
  final String categoryName;

  CategoryProductsPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  late Future<List<Product>> products;
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.categoryName, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context)=>IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,size: 30,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),),
      actions: <Widget>[
        Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openEndDrawer();
            }, icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,size: 30,));
          }
        )
      ],
      ),
      drawer: const DrawerLateral(),
      endDrawer: DrawerEnd(),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return  const LoadingWidget();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const LoadingWidget();
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
                          Text("\$ ${product.price}", style: const TextStyle(fontWeight: FontWeight.bold),),
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
    );
  }
}
