import 'dart:convert';

import 'package:first_flutter_app/screens/form/components/dialog.dart';
import 'package:first_flutter_app/screens/form/components/form_control.dart';
import 'package:first_flutter_app/shared/components/full_screen_loading.dart';
import 'package:first_flutter_app/provider/provider.dart';
import 'package:first_flutter_app/validators/email_validator.dart';
import 'package:first_flutter_app/validators/plain_text_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserForm extends ConsumerStatefulWidget {
  const UserForm({super.key});

  @override
  ConsumerState<UserForm> createState() => _UserFormState();
}

class _UserFormState extends ConsumerState<UserForm> {
    final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(formProvider);
    final notifier = ref.watch(formProvider.notifier);
    
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.dynamic_form_rounded, size: 50),
                  const Text("Formulario para validar", textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 30),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        FormControl(
                          label: "Nombre",
                          onChanged: ref.read(formProvider.notifier).onNameChange,
                          validator: (value) => ref.read(formProvider).name.error?.getErrorMessage(),
                        ),
                        FormControl(
                          label: "Apellido",
                          onChanged: ref.read(formProvider.notifier).onLastNameChange,
                          validator: (value) => ref.read(formProvider).lastName.error?.getErrorMessage(),
                        ),
                        FormControl(
                          label: "Email", 
                          keyboardType: TextInputType.emailAddress,
                          onChanged: ref.read(formProvider.notifier).onEmailChange,
                          validator: (value) => ref.read(formProvider).email.error?.getErrorMessage(),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed: () {
                                key.currentState?.validate();
                                if(provider.isValid) {
                                  notifier.registerUser().then((value) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => DialogMessage(
                                        message: ref.read(formProvider).message,
                                        onPressed: () {
                                          String jsonToSend = encodeJsonToBase64(notifier.createJson());
                                          context.go("/json/$jsonToSend");
                                        },
                                      ),
                                    );
                                  });
                                }
                              }, 
                              child: const Text("Registrarme")
                            ),
                            const SizedBox(width: 16),
                            FilledButton(
                              onPressed: () => context.go("/"), 
                              child: const Text("Cancelar")
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(ref.read(formProvider).isLoading)
          const FullScreenLoading()
        ],
      ),
    );
  }
}

String encodeJsonToBase64(Map<String, dynamic> json) {
  String jsonString = jsonEncode(json);
  List<int> bytes = utf8.encode(jsonString);
  String base64String = base64Encode(bytes);
  return base64String;
}