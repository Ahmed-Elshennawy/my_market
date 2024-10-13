import 'package:flutter/material.dart';
import '../model/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];
  final List<Product> _favorites = [];

  List<Product> get cartItems => _cartItems;
  List<Product> get favorites => _favorites;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}
