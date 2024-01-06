import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? label;
  final IconData? icon;
  const CustomAppBar({
    Key? key,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          label!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      backgroundColor: Colors.redAccent,
      elevation: 0.0,
      leading: IconButton(
        color: Colors.white,
        icon: Icon(icon),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
