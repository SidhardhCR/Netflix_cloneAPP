import 'package:flutter/material.dart';

class title extends StatelessWidget {
  const title({
    super.key,required this.title1
  });
  final String title1;
  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}