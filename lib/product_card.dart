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
      color: Color.fromRGBO(216, 230, 253, 1),
      child: Column(
        children: [
          Text(title),
          SizedBox(
            height: 5,
          ),
          Text("\$$price"),
          SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(image),
          )
        ],
      ),
    );
  }
}
