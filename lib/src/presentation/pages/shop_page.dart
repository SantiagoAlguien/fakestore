
import 'package:fakestore/src/presentation/widgets/list/CategoryList.dart';
import 'package:fakestore/src/presentation/widgets/list/ProductListScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      
      children: [
        Padding(
          padding: EdgeInsets.all(2),
          child: CategoryList()),
        Expanded(
          child: ProductListScreen(),
        ),
      ],
    );   
  }
}