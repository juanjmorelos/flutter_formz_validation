import 'package:flutter/material.dart';

class FormControl extends StatelessWidget {
  const FormControl({
    super.key, 
    required this.label,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.controller
  });
  final String label;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 2),
              )
            ),
          )
        ],
      ),
    );
  }
}