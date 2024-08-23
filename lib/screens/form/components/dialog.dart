import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({super.key, required this.message, this.onPressed});
  final String message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        FilledButton(onPressed: onPressed, child: const Text("Aceptar"))
      ],
    );
  }
}