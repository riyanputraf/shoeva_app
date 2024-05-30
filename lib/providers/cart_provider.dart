import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<ProductModel> _carts = [];

  List<ProductModel> get carts => _carts;

  set carts(List<ProductModel> carts) {
    _carts = carts;
    notifyListeners();
  }
}
