import 'package:first_flutter_app/provider/biometrics_provider.dart';
import 'package:first_flutter_app/screens/fingerprint/components/biometrics_module.dart';
import 'package:first_flutter_app/shared/components/full_screen_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

class Fingerprint extends ConsumerWidget {
  const Fingerprint({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(biometricsProvier);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¡Bienvenido!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                if(provider.haveBiometrics)
                const BiometricsModule(),
                if(!provider.haveBiometrics)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FilledButton(
                    onPressed: (){
                      context.push("/home");
                    }, 
                    child: const Text("Click aquí para ingresar")
                  ),
                )                
              ],
            ),
          ),
          if(provider.isLoading) 
          FadeIn(child: const FullScreenLoading(text: "Iniciando, por favor espere..."))
        ],
      ),
    );
  }
}