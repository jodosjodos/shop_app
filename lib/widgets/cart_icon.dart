import 'package:flutter/material.dart';

Widget BuildCartIconWithBadge(int itemCount) {
  return Stack(
    alignment: Alignment.center,
    children: [
      const Icon(Icons.shopping_cart),
      if (itemCount >
          0) // Display the badge only if itemCount is greater than 0
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              '$itemCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    ],
  );
}
