import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
        ),
        Spacer(),
        Icon(
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
        kWidth,
      ],
    );
  }
}
