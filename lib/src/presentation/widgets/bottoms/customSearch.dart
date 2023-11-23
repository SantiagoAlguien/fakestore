import 'package:flutter/material.dart';

class CustomSearchWidget extends StatefulWidget {
  @override
  _CustomSearchWidgetState createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(25.0), // Configura la forma del borde    
          color: Colors.white,
      ),  
      margin: EdgeInsets.only(top: 12),
      
      child: Row(
        children: [
          SizedBox(width: 20,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(

                hintText: 'Buscar...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Aquí puedes agregar la lógica para activar la búsqueda
              // o realizar la acción de búsqueda.
            },
          ),
        ],
      ),
    );
  }
}