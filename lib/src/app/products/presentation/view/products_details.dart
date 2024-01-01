import 'package:flutter/material.dart';
import '../../data/model/model.dart';
import '../components/components.dart';

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
            height: 300.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Image.network(
              model.image!,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 10.0),
          DetailsItem(
            label: 'Produto:',
            value: model.product!,
          ),
          const SizedBox(height: 10.0),
          DetailsItem(
            label: 'Preço:',
            value: model.price!,
          ),
          const SizedBox(height: 10.0),
          DetailsItem(
            label: 'Detalhes:',
            value: model.details!,
          ),
        ],
      ),
    );
  }
}
