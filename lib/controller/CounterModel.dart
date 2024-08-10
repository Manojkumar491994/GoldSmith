import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  List<Cart> carts = [];

  void increment() {
    _count++;
    notifyListeners();
  }
  void addToCart(Cart cart) {
    carts.add(cart);

    notifyListeners();
  }
}

class Cart {
  int id;
  String title;
  double price;
  String Image;
  String? noOfItems;

  Cart(
      {required this.id,
      required this.title,
      required this.price,
      required this.Image, this.noOfItems});
}
