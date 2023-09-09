import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 33, color: Colors.white),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
      ],
    );
  }
}
