import 'package:fakestore/src/domain/entities/product/Product.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DrawerEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShoppingCart cart = Provider.of<ShoppingCart>(context);
    double widthMedia = MediaQuery.of(context).size.width; 
    
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 20), // Espacio en la parte superior
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image.asset('lib/assets/carrito-de-compras.png', width: widthMedia*0.3), // Ajusta el path y tamaño según sea necesario
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0), child: Divider(color: Colors.grey[800],),),
          
          Text("Tu carrito", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 20),
          Text("Suma productos y consigue envio gratis", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,),),
          SizedBox(height: 10), // Espacio antes de la lista
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.removeItem(product);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MaterialButton(
            onPressed: () => _showPaymentOptions(context),
            color: Colors.blue, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
            
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Comprar Ahora",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentOptions(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Formas de Pago"),
        content: Text("Selecciona tu forma de pago"),
        actions: <Widget>[
          TextButton(
            child: Text("Tarjeta de Crédito"),
            onPressed: () {
              _handlePaymentSuccess(context);
            },
          ),
          TextButton(
            child: Text("PSE"),
            onPressed: () {
              _handlePaymentSuccess(context);
            },
          ),
          // Añadir más opciones según sea necesario
        ],
      );
    },
  );
}

void _handlePaymentSuccess(BuildContext context) {
  Navigator.of(context).pop(); // Cierra el diálogo de pago

  Provider.of<ShoppingCart>(context, listen: false).clearCart(); // Limpia el carrito

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Pago Realizado"),
        content: Text("Tu pago se ha realizado con éxito."),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo de éxito
              Provider.of<ShoppingCart>(context, listen: false).clearCart(); // Limpia el carrito
            },
          ),
        ],
      );
    }
  );
}}