
import 'package:fakestore/src/presentation/widgets/CategoryList.dart';
import 'package:fakestore/src/presentation/widgets/ProductListScreen.dart';
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
    return Column(
      
      children: [
        Container(
          height: 200,
          child: CategoryList()),
        Expanded(
          
            
            child: ProductListScreen(),
        ),
        
      ],
    );
    
  }
}