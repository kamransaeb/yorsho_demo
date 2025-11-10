import 'package:formz/formz.dart';

enum DescriptionValidationError {
  invalid,
}

class DescriptionInput extends FormzInput<String, DescriptionValidationError> {

  const DescriptionInput.pure() : super.pure('');
  const DescriptionInput.dirty([super.value = '']) : super.dirty();
  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  @override
  DescriptionValidationError? validator(String value) {
    return value.length > 10 ? null : DescriptionValidationError.invalid;
  }
  
}