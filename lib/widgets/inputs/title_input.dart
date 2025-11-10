import 'package:formz/formz.dart';

enum TitleValidationError {
  invalid,
}

class TitleInput extends FormzInput<String, TitleValidationError> {

  const TitleInput.pure() : super.pure('');

  const TitleInput.dirty([super.value = '']) : super.dirty();

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
  TitleValidationError? validator(String value) {
    return (value ?? '').length >= 2 ? null : TitleValidationError.invalid;
  }
  
}