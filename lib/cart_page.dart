import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_collection/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void onTap(BuildContext context, Map<String, dynamic> product) {
    // Provider.of<CartProvider>(
    //   context,
    //   listen: false,
    // ).removeProduct(product);
    context.read<CartProvider>().removeProduct(product);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text("product have been removed successfully"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> carts = Provider.of<CartProvider>(context).cart;
    List<Map<String, dynamic>> carts = context.watch<CartProvider>().cart;
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
                    onPressed: () => showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Delete Product",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: const Text(
                            "Are you sure you want to delete this product from your cart?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                onTap(context, cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
