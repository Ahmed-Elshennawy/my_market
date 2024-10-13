import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: cartProvider.favorites.isEmpty
          ? const Center(child: Text('No favorite items'))
          : ListView.builder(
              itemCount: cartProvider.favorites.length,
              itemBuilder: (context, index) {
                final favoriteItem = cartProvider.favorites[index];
                return ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text(favoriteItem.name),
                  subtitle: Text(
                      '\$${favoriteItem.tags.first.price.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
