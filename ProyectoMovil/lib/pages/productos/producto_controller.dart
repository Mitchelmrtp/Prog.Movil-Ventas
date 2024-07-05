import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Modelo de Producto
class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final int categoryId;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.categoryId,
  });
}

class ProductoController extends GetxController {
  RxList<Product> productos = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductos();
  }

  Future<void> fetchProductos() async {
    var url = Uri.parse('http://192.168.18.35:4912/producto/list');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Product> tempList = [];

      jsonResponse.forEach((product) {
        tempList.add(Product(
          id: product['id'],
          title: product['name'],
          image: product['image_url'],
          price: double.parse(product['precio'].toString()),
          description: product['description'],
          categoryId: product['categorys_id'],
        ));
      });

      productos.assignAll(tempList);
    } else {
      print('Error al obtener productos: ${response.statusCode}');
    }
  }
}
