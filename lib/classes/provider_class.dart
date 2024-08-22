import 'package:first_flutter_app/validators/email_validator.dart';
import 'package:first_flutter_app/validators/plain_text_validator.dart';

class ProviderClass {
  final PlainTextValidator name;
  final PlainTextValidator lastName;
  final EmailValidator email;
  final String message;
  final bool success;
  final bool isLoading;
  final bool isValid;
  
  ProviderClass({
    this.name = const PlainTextValidator.pure(),
    this.lastName = const PlainTextValidator.pure(),
    this.email = const EmailValidator.pure(),
    this.message = "",
    this.success = false,
    this.isLoading = false,
    this.isValid = false
  });

  ProviderClass copyWith({
    PlainTextValidator? name,
    PlainTextValidator? lastName,
    EmailValidator? email,
    String? message,
    bool? success,
    bool? isLoading,
    bool? isValid
  }) {
    return ProviderClass(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      message: message ?? this.message,
      success: success ?? this.success,
      isLoading: isLoading ?? this.isLoading,
      isValid: isValid ?? this.isValid
    );
  }
}