import 'package:formz/formz.dart';

enum BodyValidationError {
  invalid,
}

class BodyInput extends FormzInput<String, BodyValidationError> {

  const BodyInput.pure() : super.pure('');
  const BodyInput.dirty([super.value = '']) : super.dirty();
  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  @override
  BodyValidationError? validator(String value) {
    //return value.length > 10 ? null : DescriptionExtendValidationError.invalid;
    return null;
  }
  
}