import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 15,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.elliptical(150, 22),
        ),
        color: Colors.black38,
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .scaleX(
          begin: 1.2,
          end: .8,
          curve: Curves.easeInOut,
          duration: 1000.ms,
        )
        .then()
        .scaleX(
          begin: .8,
          end: 1.2,
          curve: Curves.easeInOut,
          duration: 1000.ms,
        );
  }
}
