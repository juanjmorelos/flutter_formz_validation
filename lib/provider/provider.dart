import 'package:first_flutter_app/classes/provider_class.dart';
import 'package:first_flutter_app/validators/email_validator.dart';
import 'package:first_flutter_app/validators/plain_text_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final formProvider = StateNotifierProvider<FormPoviderNotifier, ProviderClass>((ref) {
  return FormPoviderNotifier();
});

class FormPoviderNotifier  extends StateNotifier<ProviderClass> {
  FormPoviderNotifier(): super (ProviderClass());

  void onNameChange(String value) {
    final name = PlainTextValidator.dirty(value);
    final status = Formz.validate([name, state.lastName, state.email]);
    state = state.copyWith(name: name, isValid: status);
  }

  void onLastNameChange(String value) {
    final lastName = PlainTextValidator.dirty(value);
    final status = Formz.validate([state.name, lastName, state.email]);
    state = state.copyWith(lastName: lastName, isValid: status);
  }

  void onEmailChange(String value) {
    final email = EmailValidator.dirty(value);
    final status = Formz.validate([state.name, state.lastName, email]);
    state = state.copyWith(email: email, isValid: status);
  }

  setIsSuccess(bool value) {
    state = state.copyWith(success: value);
  }

  setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  setMessage(String value) {
    state = state.copyWith(message: value);
  }

  Future<void> registerUser() async {
    setIsLoading(true);
    await Future.delayed(const Duration(milliseconds: 2000));
    setMessage("El usuario se registró exitosamente");
    setIsSuccess(true);
    setIsLoading(false);
  }

  Map<String, dynamic> createJson() {
    return {
      "name": state.name.value.trim(),
      "lastName": state.lastName.value.trim(),
      "email": state.email.value.trim(),
    };
  }
}