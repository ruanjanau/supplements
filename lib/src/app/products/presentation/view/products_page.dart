import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplements/src/app/components/components.dart';
import '../../data/models/model.dart';

import '../components/components.dart';

import 'bloc/products_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Suplementos e Acessórios',
        icon: Icons.arrow_back_ios_new,
      ),
      body: BlocListener<ProductsBloc, ProductsState>(
        listenWhen: (previous, current) {
          return current.maybeWhen(
            error: (error) => true,
            orElse: () => false,
          );
        },
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ErrorSnackbar.show(context, error);
            },
          );
        },
        child: BlocSelector<ProductsBloc, ProductsState, List<ProductsModel>>(
          selector: (state) {
            return state.maybeWhen(
              data: (products) => products,
              orElse: () => [],
            );
          },
          builder: (_, products) {
            if (products.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                primary: false,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisExtent: 220.0,
                  mainAxisSpacing: 12.0,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/bloc/details/',
                        arguments: product,
                      );
                    },
                    child: CardProducts(
                      image: product.image!,
                      stock: product.stock!,
                      product: product.product!,
                      price: product.price!,
                      brand: product.brand!,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
