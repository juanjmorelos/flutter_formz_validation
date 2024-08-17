import 'package:formz/formz.dart';

enum EmailValidationError { 
  invalid, 
  invalidFormat 
}

extension EmailValidationErrorx on EmailValidationError {
  String getErrorMessage() {
    switch (this) {
      case EmailValidationError.invalid:
        return 'Este campo no puede estar vacío';
      case EmailValidationError.invalidFormat:
        return 'Ingrese un email valido';
    }
  }
}

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');
  const EmailValidator.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if(value == "") {
      return EmailValidationError.invalid;
    }
    
    final emailRegExp = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
      caseSensitive: false,
    );

    if (!emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalidFormat;
    }
    return null;
  }
}