import 'package:formz/formz.dart';

enum TaxNumberValidationError {
  invalid,
}

class TaxNumberInput extends FormzInput<String, TaxNumberValidationError> {

  const TaxNumberInput.pure() : super.pure('');
  const TaxNumberInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _taxNumberRegExp =
  //RegExp(r"^[0-9]{11}$");
  RegExp(r'^[0-9]+$',);

  @override
  TaxNumberValidationError? validator(String value) {
    return (value.length >= 10 && _taxNumberRegExp.hasMatch(value ?? '')) ? null : TaxNumberValidationError.invalid;
  }

}