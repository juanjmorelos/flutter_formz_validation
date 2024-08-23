import 'package:first_flutter_app/screens/json/components/dot.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 15;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)),
        color: color,
        border: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(63, 203, 203, 203), 
            width: 0.5,
          ),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Dot(color: Color.fromRGBO(220, 38, 38, 1)),
              SizedBox(width: 4),
              Dot(color: Color.fromRGBO(202, 138, 4, 1)),
              SizedBox(width: 4),
              Dot(color: Color.fromRGBO(22, 163, 74, 1))
            ],
          ),
          Text("JSON", style: TextStyle(color: Color.fromARGB(255, 202, 202, 202)))
        ],
      ),
    );
  }
}