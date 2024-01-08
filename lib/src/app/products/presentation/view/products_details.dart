import 'package:flutter/material.dart';
import '../../../components/components.dart';
import '../../data/models/model.dart';
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
      backgroundColor: Colors.redAccent,
      appBar: const CustomAppBar(
        icon: Icons.arrow_back_ios_new,
        label: 'Detalhes do Produto',
      ),
      body: Column(
        children: [
          Container(
            height: 300.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Image.network(
              model.image!,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(40),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView(
                  children: [
                    DetailsItem(
                      label: 'Produto',
                      value: model.product!,
                    ),
                    const SizedBox(height: 10.0),
                    DetailsItem(
                      label: 'Marca',
                      value: model.brand!,
                    ),
                    const SizedBox(height: 10.0),
                    DetailsItem(
                      label: 'Detalhes',
                      value: model.details!,
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    Center(
                      child: CustomButton(
                        color: Colors.redAccent,
                        text: 'Adicionar ao Carrinho',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
