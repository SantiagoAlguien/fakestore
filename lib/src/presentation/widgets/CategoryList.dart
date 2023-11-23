// ignore_for_file: must_call_super
import 'package:fakestore/cosnt.dart';
import 'package:fakestore/src/data/datasources/CategoryRemote.dart';
import 'package:fakestore/src/data/repositories/CategoryImpl.dart';
import 'package:fakestore/src/domain/entities/product/Category.dart';
import 'package:fakestore/src/domain/repositories/CategoryRepository/getAllCategory.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  
  late Future<List<Category>> categories;
  late GetCategoryUserCase getCategoryUserCase;

  final Map<String, String> categoryImages = {
    "electronics": "lib/assets/electronics.png",
    "jewelery": "lib/assets/jewelery.png",
    "men's clothing": "lib/assets/men's clothing.png",
    "women's clothing": "lib/assets/women's clothing.png",
  };

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
      padding: const EdgeInsets.all(1.0),
      child: FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles.'));
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: snapshot.data!.map((category) {
                String categoryName = category.name;
                String imagePath = categoryImages[categoryName] ?? 'lib/assets/default.png';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Agregar aquí la lógica para manejar la selección de la categoría
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            backgroundImage: AssetImage(imagePath),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        categoryName,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
