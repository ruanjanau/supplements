// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomHomeContainer extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTapCall;

  const CustomHomeContainer({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTapCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCall,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Container(
            width: 140.0,
            height: 100.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(
                    5,
                    5,
                  ),
                ),
              ],
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
