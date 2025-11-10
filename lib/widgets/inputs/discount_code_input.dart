import 'package:formz/formz.dart';

enum DiscountCodeValidationError {
  invalid,
}

class DiscountCodeInput extends FormzInput<String, DiscountCodeValidationError> {

  const DiscountCodeInput.pure() : super.pure('');

  const DiscountCodeInput.dirty([super.value = '']) : super.dirty();

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
  DiscountCodeValidationError? validator(String? value) {
    return (value ?? '').length >= 6 ? null : DiscountCodeValidationError.invalid;
  }
  
}