import 'package:flutter/material.dart';

class ButtonTextIcon extends StatelessWidget {
  const ButtonTextIcon({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
