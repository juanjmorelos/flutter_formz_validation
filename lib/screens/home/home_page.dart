import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Bienvenido, ingrese para aprender a validar un formulario", 
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Card(
              margin: EdgeInsets.zero, // Para que el efecto ripple cubra todo el área
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      context.go("/form");
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.dynamic_form),
                          SizedBox(height: 16),
                          Text("Validar Formulario")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}