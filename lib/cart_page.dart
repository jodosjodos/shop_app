import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_collection/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void onTap(BuildContext context, Map<String, dynamic> product) {
    Provider.of<CartProvider>(
      context,
      listen: false,
    ).removeProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> carts = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: carts.isEmpty
          ? Center(
              child: Text(
                "No product is added to cart yet",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.red),
              ),
            )
          : ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> cartItem = carts[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(cartItem["imageUrl"] as String),
                  ),
                  title: Text(
                    cartItem["title"].toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    "Size:  ${cartItem["sizes"]}",
                  ),
                  trailing: IconButton(
                    onPressed: () => onTap(context, cartItem),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              }),
    );
  }
}
