import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app/login/view/login.dart';
import 'app/products/data/datasource/datasource.dart';
import 'app/products/presentation/view/bloc/products_bloc.dart';
import 'app/products/presentation/view/view.dart';
import 'app/splash/view/splash.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ProductsDataSource(Dio()),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => LoginPage(),
          '/products': (context) => BlocProvider(
                create: (context) =>
                    ProductsBloc(dataSource: context.read<ProductsDataSource>())
                      ..add(const ProductsEvent.finAll()),
                child: const ProductsPage(),
              ),
        },
      ),
    );
  }
}
