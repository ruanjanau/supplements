import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/image/suplementos.png',
              height: 270,
            ),
          )
              .animate()
              .slide(
                duration: const Duration(seconds: 1),
              )
              .fade(),
        ],
      ),
    );
  }
}
