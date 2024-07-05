import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/inicio/inicio_controller.dart';
import 'package:timeapp/pages/productos/producto_controller.dart';
import 'package:timeapp/pages/productos/producto_page.dart';
import 'package:timeapp/pages/slider/slider_page.dart';
import 'package:timeapp/pages/widgets/constants.dart';

class InicioPage extends StatelessWidget {
  final InicioController control = Get.put(InicioController());
  final ProductoController productoController = Get.put(ProductoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8), // Ajusté el valor del padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderPage(),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Ofertas para ti",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductPage(),
                          ),
                        );
                      },
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductPage(),
                            ),
                          );
                        },
                        child: Text("ver más"),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (productoController.productos.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: productoController.productos.length > 6
                          ? 6
                          : productoController.productos.length, // Limitar a 6 productos si hay más
                      itemBuilder: (context, index) {
                        return ProductGrid(product: productoController.productos[index]);
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
