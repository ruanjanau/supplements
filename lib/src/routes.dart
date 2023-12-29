import 'package:flutter/material.dart';

import 'app/splash/view/splash.dart';

import 'app/login/view/login.dart';
import 'app/products/presentation/view/view.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginPage(),
        '/products': (context) => const ProductsPage(),
      },
    );
  }
}
