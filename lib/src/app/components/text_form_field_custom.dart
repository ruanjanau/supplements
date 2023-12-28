import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;

  const TextFormFieldCustom({
    super.key,
    required this.icon,
    required this.controller,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
