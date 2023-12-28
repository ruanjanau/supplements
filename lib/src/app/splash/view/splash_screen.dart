import 'package:flutter/material.dart';
import '../../login/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var width = 0.0;
  var heigth = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        width = 300.0;
        heigth = 300.0;
      });
      final nav = Navigator.of(context);
      await Future.delayed(const Duration(seconds: 3));
      nav.pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAniumation) => LoginPage(),
          settings: const RouteSettings(
            name: '/login',
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: width,
          height: heigth,
          child: Hero(
            tag: 'splash',
            child: Image.asset('assets/image/janau.jpeg'),
          ),
        ),
      ),
    );
  }
}
