import 'package:local_auth/local_auth.dart';

class FingerprintProviderClass {
  final List<BiometricType> biometricType;
  final bool haveBiometrics;
  final bool isLoading;
  final bool didAuhtenicate;
  final bool firstTime;

  FingerprintProviderClass({
    this.biometricType = const [],
    this.haveBiometrics = false,
    this.isLoading = true,
    this.didAuhtenicate = false,
    this.firstTime = true
  });
  
  FingerprintProviderClass copyWith({
    List<BiometricType>? biometricType,
    bool? haveBiometrics,
    bool? isLoading,
    bool? didAuhtenicate,
    bool? firstTime
  }) {
    return FingerprintProviderClass(
      biometricType: biometricType ?? this.biometricType,
      haveBiometrics: haveBiometrics ?? this.haveBiometrics,
      isLoading: isLoading ?? this.isLoading,
      didAuhtenicate: didAuhtenicate ?? this.didAuhtenicate,
      firstTime: firstTime ?? this.firstTime
    );
  }
}