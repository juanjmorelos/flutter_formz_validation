import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({
    super.key, 
    this.radius = 10,
    required this.color
  });
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final borderRadius = radius / 2;
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
    );
  }
}