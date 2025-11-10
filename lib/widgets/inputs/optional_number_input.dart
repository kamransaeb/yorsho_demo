import 'package:formz/formz.dart';

enum OptionalNumberValidationError {
  invalid,
}

class OptionalNumberInput extends FormzInput<String, OptionalNumberValidationError> {

  const OptionalNumberInput.pure() : super.pure('');

  const OptionalNumberInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _numberRegExp =
  RegExp(r'^[0-9]*$',);

  @override
  OptionalNumberValidationError? validator(String? value) {
    return _numberRegExp.hasMatch(value ?? '')
        ? null
        : OptionalNumberValidationError.invalid;
  }
  
}