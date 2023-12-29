import 'package:flutter/material.dart';

class CardProducts extends StatelessWidget {
  final String image;
  final String product;
  final int price;
  const CardProducts({
    super.key,
    required this.image,
    required this.product,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            product,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                price.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
