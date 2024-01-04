import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/product/data/model/model.dart';

import 'src/app/login/view/login.dart';
import 'src/app/product/data/datasource/datasource.dart';
import 'src/app/product/presentation/view/bloc/products_bloc.dart';
import 'src/app/product/presentation/view/view.dart';
import 'src/app/splash/view/splash.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => ProductsDataSource(Dio()),
      child: MaterialApp(
        routes: {
          '/': (_) => const SplashScreen(),
          '/login': (_) => LoginPage(),
          '/bloc/home/': (context) => BlocProvider(
                create: (_) => ProductsBloc(
                  dataSource: context.read<ProductsDataSource>(),
                )..add(const ProductsEvent.findAll()),
                child: const ProductsPage(),
              ),
          '/bloc/details/': (context) {
            final product =
                ModalRoute.of(context)!.settings.arguments as ProductsModel;
            return ProductsDetails(model: product);
          }
        },
      ),
    ),
    // ),
  );
}
