import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomImageAnimate extends StatelessWidget {
  const CustomImageAnimate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'splash',
        child: Image.asset(
          'assets/image/j.png',
          height: 160,
        ),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .moveY(
          begin: -25,
          end: 8,
          curve: Curves.easeInOut,
          duration: 1000.ms,
        )
        .then()
        .moveY(
          begin: 8,
          end: -25,
          curve: Curves.easeInOut,
          duration: 1000.ms,
        );
  }
}
