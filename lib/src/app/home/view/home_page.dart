import 'package:flutter/material.dart';
import 'package:supplements/src/app/components/components.dart';
import 'package:supplements/src/app/home/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            const CarouselImage(),
            const SizedBox(height: 20.0),
            const Text(
              'Opções e Carrinho',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CustomContainer(
                    onTapCall: () {
                      Navigator.pushNamed(
                        context,
                        '/bloc/products/',
                      );
                    },
                    label: 'Produtos',
                    icon: Icons.adb_rounded,
                  ),
                  const Spacer(),
                  CustomContainer(
                    onTapCall: () {},
                    label: 'Carrinho',
                    icon: Icons.shopping_cart_rounded,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
