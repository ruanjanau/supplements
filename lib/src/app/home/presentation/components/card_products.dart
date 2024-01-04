import 'package:flutter/material.dart';

class CardProducts extends StatelessWidget {
  final String image;
  final String product;
  final String price;

  const CardProducts({
    Key? key,
    required this.image,
    required this.product,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    product,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          price,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0)
                ],
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                  iconSize: 34,
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    //TODO: aply logic for favorites
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
