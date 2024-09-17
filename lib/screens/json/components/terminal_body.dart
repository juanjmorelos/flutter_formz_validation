import 'dart:convert';
import 'dart:typed_data';
import 'package:first_flutter_app/screens/json/customTheme/atomCustomTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class TerminalBody extends StatelessWidget {
  const TerminalBody({super.key, required this.color, required this.content});
  final Color color;
  final String content;
  

  @override
  Widget build(BuildContext context) {
    double borderRadius = 15;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius))
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        
        child: HighlightView(
          decodeJson(content),
          language: 'json',
          theme: atomCustomDarkTheme(color: color),
          padding: EdgeInsets.zero,  // Sin relleno adicional
          textStyle: const TextStyle(
            fontFamily: 'Jetbrains',
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: Color.fromARGB(255, 202, 202, 202)
          ),
        ),
      ),
    );
  }

  String decodeJson(String json) {
    Uint8List bytes = base64Decode(json);
    String decodedString = utf8.decode(bytes);
    Map<String, dynamic> jsonMap = jsonDecode(decodedString);
    String prettyJson = const JsonEncoder.withIndent('  ').convert(jsonMap);
    return prettyJson;
  }
}