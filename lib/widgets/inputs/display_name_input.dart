import 'package:formz/formz.dart';

enum DisplayNameValidationError {
  invalid,
}

class DisplayNameInput extends FormzInput<String, DisplayNameValidationError> {

  const DisplayNameInput.pure() : super.pure('');

  const DisplayNameInput.dirty([super.value = '']) : super.dirty();

  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  @override
  DisplayNameValidationError? validator(String value) {
    return value.length > 3 ? null : DisplayNameValidationError.invalid;
    //return _nameRegExp.hasMatch(value ?? '') ? null : DisplayNameValidationError.invalid;
  }
  
}