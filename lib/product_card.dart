import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});
  final String title;
  final double price;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(216, 230, 253, 1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "\$$price",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset(
                image,
                height: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
