import 'package:first_flutter_app/classes/biometric_type.dart';
import 'package:first_flutter_app/provider/biometrics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BiometricsModule extends ConsumerWidget {
  const BiometricsModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(biometricsProvier.notifier);
    final provider = ref.watch(biometricsProvier);
    

    if (provider.didAuhtenicate) {
      _navigateToHome(context);
    } else if(provider.firstTime) {
        notifier.authUser();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            notifier.getBiometricType().getString(), 
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w300
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: ElevatedButton(
            onPressed: () {
              notifier.authUser();
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Autenticarme"),
                const SizedBox(width: 8),
                Icon(notifier.getBiometricType().getIcon())
              ],
            )
          ),
        )
      ],
    );
  }
}

void _navigateToHome(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.push("/home");
  });
}