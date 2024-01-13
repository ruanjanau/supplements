import 'package:flutter/material.dart';

import 'package:supplements/src/app/home/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 10.0),
          const CarouselImage(),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Suplementos e Carrinho...',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomHomeContainer(
                onTapCall: () {
                  Navigator.pushNamed(
                    context,
                    '/bloc/products/',
                  );
                },
                label: 'Suplementos',
                icon: Icons.shopify_rounded,
              ),
              const SizedBox(width: 40.0),
              CustomHomeContainer(
                onTapCall: () {},
                label: 'Carrinho',
                icon: Icons.shopping_cart_rounded,
              ),
            ],
          )
        ],
      ),
    );
  }
}
