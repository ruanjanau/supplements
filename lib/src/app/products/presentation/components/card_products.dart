import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CardProducts extends StatelessWidget {
  final String image;
  final bool stock;
  final String product;
  final String price;
  final String brand;

  const CardProducts({
    Key? key,
    required this.image,
    required this.stock,
    required this.product,
    required this.price,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 190,
        height: 245,
        decoration: BoxDecoration(
          color: stock == true ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.redAccent.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                  image,
                  height: 110,
                ),
              ),
              Text(
                product,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                brand,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: stock == true ? Colors.greenAccent : Colors.grey,
                ),
                child: Text(
                  stock == true ? 'Disponível' : 'Esgotado',
                  style: TextStyle(
                    color: stock == true ? Colors.black : Colors.redAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ).animate().slide().fade(),
    );
  }
}
