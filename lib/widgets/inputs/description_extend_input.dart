import 'package:formz/formz.dart';

enum DescriptionExtendValidationError {
  invalid,
}

class DescriptionExtendInput extends FormzInput<String, DescriptionExtendValidationError> {

  const DescriptionExtendInput.pure() : super.pure('');
  const DescriptionExtendInput.dirty([super.value = '']) : super.dirty();
  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  @override
  DescriptionExtendValidationError? validator(String value) {
    //return value.length > 10 ? null : DescriptionExtendValidationError.invalid;
    return null;
  }
  
}