import 'package:first_flutter_app/screens/json/components/terminal_body.dart';
import 'package:first_flutter_app/screens/json/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JsonScreen extends StatelessWidget {
    const JsonScreen({
        super.key,
        required this.json
    });
    final String json;

    @override
    Widget build(BuildContext context) {
      Color color = const Color.fromRGBO(17, 24, 39, 1);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.go("/form");
            },
            child: const Icon(Icons.arrow_back_rounded), 
          ),
            body: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 85),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        const Icon(Icons.data_object_rounded, size: 50),
                        const Text("Datos resultantes", textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 30),
                        TopBar(color: color),
                        TerminalBody(color: color, content: json)
                    ],
                ),
            ),
        );
    }
}