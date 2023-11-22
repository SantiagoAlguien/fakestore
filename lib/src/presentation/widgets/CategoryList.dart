// ignore_for_file: must_call_super


import 'package:fakestore/src/data/datasources/CategoryRemote.dart';
import 'package:fakestore/src/data/repositories/CategoryImpl.dart';
import 'package:fakestore/src/domain/entities/product/Category.dart';
import 'package:fakestore/src/domain/repositories/CategoryRepository/getAllCategory.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late Future<List<Category>> categories;
  late GetCategoryUserCase getCategoryUserCase;

  // ignore: must_call_super
  @override
  void initState() {
  
  // Crea una instancia de CategoriesRemoteDataSource
  var categoriesRemoteDataSource = CategoriesRemoteDataSource();

  // Crea una instancia de Impl con CategoriesRemoteDataSource
  var categoryRepository = CategoryRepositoryImpl(categoriesRemoteDataSource);

  // Ahora utiliza  para crear GetProductUserCase
  getCategoryUserCase = GetCategoryUserCase(categoryRepository);

  // Llama a getAll para obtener los productos
  categories = getCategoryUserCase.getAll();
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(snapshot.data![index].name),
                    ],
                  )
                ),
                
              );
            },
          );
        },
      ),
    );
  }
}