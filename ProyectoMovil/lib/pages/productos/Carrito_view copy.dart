import 'package:flutter/material.dart';
import 'package:timeapp/pages/carrito/carrito_page.dart';
import 'package:timeapp/pages/productos/gridview_controller.dart';
import 'package:timeapp/pages/productos/gridview_page.dart';

class Carrito_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CarritoPage();
        },
      ),
    );
  }
}
