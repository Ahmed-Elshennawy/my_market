import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    final existingItem = _items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );

    existingItem.quantity++;
    }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
  }

  void clear() {
    _items.clear();
  }
}
