import 'package:formz/formz.dart';

enum DiscountCodePoolListSizeValidationError {
  invalid,
}

class DiscountCodePoolListSizeInput extends FormzInput<String, DiscountCodePoolListSizeValidationError> {

  const DiscountCodePoolListSizeInput.pure() : super.pure('');

  const DiscountCodePoolListSizeInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _numberRegExp =
  RegExp(r'^[0-9]+$',);

  @override
  DiscountCodePoolListSizeValidationError? validator(String? value) {
    return  (value == null) ? DiscountCodePoolListSizeValidationError.invalid :
    (_numberRegExp.hasMatch(value) && (int.parse(value) < 10000)) ? null :
    DiscountCodePoolListSizeValidationError.invalid;
  }
  
}