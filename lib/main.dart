import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/login/view/login.dart';
import 'src/app/products/data/datasource/datasource.dart';
import 'src/app/products/presentation/view/bloc/products_bloc.dart';
import 'src/app/products/presentation/view/view.dart';
import 'src/app/splash/view/splash.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => ProductsDataSource(Dio()),
      child: MaterialApp(
        routes: {
          '/': (_) => const SplashScreen(),
          '/login': (_) => LoginPage(),
          '/bloc/products/': (context) => BlocProvider(
                create: (_) =>
                    ProductsBloc(dataSource: context.read<ProductsDataSource>())
                      ..add(const ProductsEvent.findAll()),
                child: const ProductsPage(),
              ),
        },
      ),
    ),
    // ),
  );
}
