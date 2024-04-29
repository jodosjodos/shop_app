import 'package:flutter/material.dart';
import 'package:shoes_collection/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              title: Text(
                cartItem["title"].toString(),
              ),
              subtitle: Text(
                "Size:  ${cartItem["sizes"]}",
              ),
            );
          }),
    );
  }
}
