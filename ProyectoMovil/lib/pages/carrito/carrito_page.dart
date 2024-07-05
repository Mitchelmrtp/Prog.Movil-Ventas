// favorite_page.dart
import 'package:flutter/material.dart';
import 'package:timeapp/pages/carrito/carrito_controller.dart';
import 'package:timeapp/pages/widgets/constants.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        centerTitle: true,
        title: const Text(
          "Carro de Compras",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: const Icon(Icons.back_hand),
          ),
        ),
      ),
      bottomSheet: CheckOutBox(
        items: carrito,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => CartTile(
          item: carrito[index],
          onRemove: () {
            if (carrito[index].quantity != 1) {
              setState(() {
                carrito[index].quantity--;
              });
            }
          },
          onAdd: () {
            setState(() {
              carrito[index].quantity++;
            });
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: carrito.length,
      ),
    );
  }
}
