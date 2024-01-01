import 'package:flutter/material.dart';
import 'package:supplements/src/app/products/data/model/model.dart';
import 'package:supplements/src/app/products/presentation/components/details_item.dart';

class ProductsDetails extends StatelessWidget {
  final ProductsModel model;
  const ProductsDetails({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white30,
            ),
            child: Image.asset(
              model.image!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10.0),
          DetailsItem(
            text: 'Produto',
            value: model.product!,
          ),
          const SizedBox(height: 10.0),
          Text(
            model.price!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 10.0),
          DetailsItem(
            text: 'Detalhes:',
            value: model.details!,
          ),
        ],
      ),
    );
  }
}
