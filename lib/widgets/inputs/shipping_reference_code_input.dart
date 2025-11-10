import 'package:formz/formz.dart';

enum ShippingReferenceCodeValidationError {
  invalid,
}

class ShippingReferenceCodeInput extends FormzInput<String, ShippingReferenceCodeValidationError> {

  const ShippingReferenceCodeInput.pure() : super.pure('');

  const ShippingReferenceCodeInput.dirty([super.value = '']) : super.dirty();

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
  ShippingReferenceCodeValidationError? validator(String? value) {
    return (value ?? '').length >= 6 ? null : ShippingReferenceCodeValidationError.invalid;
  }
  
}