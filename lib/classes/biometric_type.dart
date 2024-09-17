import 'package:flutter/material.dart';

enum Biometrics {
  FINGERPRINT,
  FACE_ID,
  NONE
}

extension BiometricsToString on Biometrics {
  String getString() {
    switch(this) {
      case Biometrics.FACE_ID:
        return "Autentíquese por Face Id";
      case Biometrics.FINGERPRINT:
        return "Autentíquese con lector de huella";
      case Biometrics.NONE:
        return "No fue posible identificar el metodo de autenticación";
    }
  }

  IconData getIcon() {
    switch(this) {
      case Biometrics.FACE_ID:
        return Icons.face_rounded;
      case Biometrics.FINGERPRINT:
        return Icons.fingerprint_rounded;
      case Biometrics.NONE:
        return Icons.error_outline_rounded;
    }
  }
}