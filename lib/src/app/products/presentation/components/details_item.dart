import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String text;
  final String value;

  const DetailsItem({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        RichText(
          text: TextSpan(
            text: text,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
            children: <TextSpan>[
              TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
