import 'package:flutter/material.dart';

class ButtonTextIcon extends StatelessWidget {
  const ButtonTextIcon(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18,
      this.defColor = Colors.white});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final Color defColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.normal,
              color: defColor),
        )
      ],
    );
  }
}
