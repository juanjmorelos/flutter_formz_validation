import 'package:first_flutter_app/classes/biometric_type.dart';
import 'package:first_flutter_app/classes/fingerprint_provider_class.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

final biometricsProvier = StateNotifierProvider<BiometricsProviderNotifer, FingerprintProviderClass>((ref) { 
  return BiometricsProviderNotifer();
});

class BiometricsProviderNotifer extends StateNotifier<FingerprintProviderClass> {
  BiometricsProviderNotifer(): super(FingerprintProviderClass()){
    checkBiometrics();
  }

  final LocalAuthentication auth = LocalAuthentication();


  setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
  
  setHaveBiometrics(bool value) {
    state = state.copyWith(haveBiometrics: value);
  }
  
  setDidAuthenticate(bool value) {
    state = state.copyWith(didAuhtenicate: value);
  }
  
  setFirstTime(bool value) {
    state = state.copyWith(firstTime: value);
  }
  
  setBiometricsType(List<BiometricType> value) {
    state = state.copyWith(biometricType: value);
  }

  Future<void> checkBiometrics() async {
    bool canCheckBiometrics;
    setIsLoading(true);
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      setHaveBiometrics(canCheckBiometrics || await auth.isDeviceSupported());
      if (state.haveBiometrics) {
        List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
        setBiometricsType(availableBiometrics);
      }
      setIsLoading(false);
    } catch (e) {
      setHaveBiometrics(false);
      setIsLoading(false);
    }
  }

  Biometrics getBiometricType() {
    if (state.biometricType.contains(BiometricType.face)) {
      return Biometrics.FACE_ID;
    }
    if (state.biometricType.contains(BiometricType.strong)) {
      return Biometrics.FINGERPRINT;
    }
    return Biometrics.NONE;
  }

  Future<void> authUser() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Autenticación requerida',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Por favor autentiquese con su huella digital',
            cancelButton: 'Cancelar',
          ),
          IOSAuthMessages(
            cancelButton: 'Cancelar',
          ),
        ]);
        setDidAuthenticate(didAuthenticate);
        setFirstTime(false);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.notEnrolled) {
        // ...
      } else {
        // ...
      }
    }
  }
}