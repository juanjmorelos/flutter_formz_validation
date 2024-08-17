import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        FilledButton(onPressed: () => context.pop(), child: const Text("Aceptar"))
      ],
    );
  }
}