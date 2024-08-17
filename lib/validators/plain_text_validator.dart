import 'package:formz/formz.dart';

enum PlainTextValidatorError { 
  empty
}
extension PlainTextValidatorErrorX on PlainTextValidatorError {
  String getErrorMessage() {
    switch (this) {
      case PlainTextValidatorError.empty:
        return "Este campo no puede estar vacío";
    }
  }
}


class PlainTextValidator extends FormzInput<String, PlainTextValidatorError> {
  const PlainTextValidator.pure() : super.pure('');
  const PlainTextValidator.dirty([super.value = '']) : super.dirty();
  
  @override
  PlainTextValidatorError? validator(String value) {
    return value.isEmpty ? PlainTextValidatorError.empty : null;
  }
}