import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app/login/view/login.dart';
import 'src/app/products/presentation/view/view.dart';
import 'src/app/splash/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/',
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
