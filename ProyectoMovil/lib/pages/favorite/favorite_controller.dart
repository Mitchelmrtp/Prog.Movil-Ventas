import 'package:timeapp/pages/productos/gridview_controller.dart';

// Cart Item Model
class Favorite_controller {
  final Product product;
  int quantity;

  Favorite_controller({
    required this.product,
    this.quantity = 1,
  });
}

List<Favorite_controller> Favoritos = [
  Favorite_controller(product: products[0]),
  Favorite_controller(product: products[1]),
];
