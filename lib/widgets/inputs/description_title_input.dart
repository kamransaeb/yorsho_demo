import 'package:formz/formz.dart';

enum DescriptionTitleValidationError {
  invalid,
}

class DescriptionTitleInput extends FormzInput<String, DescriptionTitleValidationError> {

  const DescriptionTitleInput.pure() : super.pure('');

  const DescriptionTitleInput.dirty([super.value = '']) : super.dirty();

  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  // static final _passwordRegExp =
  // RegExp(r'^.{6,}$');

  // @override
  // PasswordValidationError? validator(String? value) {
  //   return _passwordRegExp.hasMatch(value ?? '')
  //       ? null
  //       : PasswordValidationError.invalid;
  // }

  @override
  DescriptionTitleValidationError? validator(String? value) {
    return null;
    //return (value ?? '').length >= 3 ? null : TitleValidationError.invalid;
  }
  
}