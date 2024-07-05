import 'package:flutter/material.dart';
import 'package:timeapp/pages/productos/gridview_controller.dart';

class ProductGridPrueba extends StatelessWidget {
  final Product product;

  const ProductGridPrueba({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 20, // Altura mínima del ProductGridPrueba
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width, // Ajustar al ancho de la pantalla
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
                        DataColumn(label: Text('Attribute')),
                        DataColumn(label: Text('Value')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Description')),
                          DataCell(Text(product.description)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Category')),
                          DataCell(Text(product.category)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Colors')),
                          DataCell(
                            Row(
                              children: product.colors
                                  .map((color) => Container(
                                        width: 20,
                                        height: 20,
                                        color: color,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Rating')),
                          DataCell(Text(product.rate.toString())),
                        ]),
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
