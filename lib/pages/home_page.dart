import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_collection/pages/cart_page.dart';
import 'package:shoes_collection/providers/cart_provider.dart';
import 'package:shoes_collection/widgets/cart_icon.dart';
import 'package:shoes_collection/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [const ProductList(), const CartPage()];
  @override
  Widget build(BuildContext context) {
    int cartItemCount = Provider.of<CartProvider>(context)
        .cart
        .length; // Static number of items in the cart
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: buildCartIconWithBadge(cartItemCount),
          )
        ],
      ),
    );
  }
}
