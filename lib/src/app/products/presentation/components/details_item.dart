import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailsItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w800,
              fontSize: 22.0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
