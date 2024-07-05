import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/constants.dart';
import 'producto_controller.dart';

class ProductPage extends StatelessWidget {
  final ProductoController controller = Get.put(ProductoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relojes en Oferta'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.productos.length,
        itemBuilder: (context, index) {
          return ProductGrid(product: controller.productos[index]);
        },
      )),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final Product product;

  const ProductGrid({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductGridPrueba(product: product),
          ),
        );
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100,
          ),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    '$BASE_URL${product.image}',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        product.description,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGridPrueba extends StatelessWidget {
  final Product product;

  const ProductGridPrueba({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 20,
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  '$BASE_URL${product.image}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Atributo')),
                        DataColumn(label: Text('Valor')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Descripción')),
                          DataCell(Text(product.description)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Categoría')),
                          DataCell(Text(product.categoryId.toString())),
                        ]),
                        // Añade más filas según sea necesario para otros atributos
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
