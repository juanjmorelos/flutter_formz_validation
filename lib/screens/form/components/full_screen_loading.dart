import 'package:flutter/material.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.7),
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          SizedBox(height: 20),
          Text("Validando...", style: TextStyle(fontSize: 18, color: Colors.white),)
        ],
      ),
    );
  }
}