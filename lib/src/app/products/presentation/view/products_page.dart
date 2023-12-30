import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/model.dart';

import '../components/components.dart';

import 'bloc/products_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 195, 195),
      appBar: AppBar(
        title: const Text('Suplementos'),
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
        }, builder: (_, products) {
          if (products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return CarouselSlider.builder(
              itemCount: products.length,
              itemBuilder: (context, index, realIndex) {
                final product = products[index];
                return CardProducts(
                  image: product.image!,
                  product: product.product!,
                  price: product.price!,
                );
              },
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                // autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                // autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            );
          }
        }),
      ),
    );
  }
}
