import 'package:formz/formz.dart';

enum TurkishIdentificationNumberValidationError {
  invalid,
}

class TurkishIdentificationNumberInput extends FormzInput<String, TurkishIdentificationNumberValidationError> {

  const TurkishIdentificationNumberInput.pure() : super.pure('');
  const TurkishIdentificationNumberInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _turkishIdentificationNumberRegExp =
  RegExp(r"^[1-9]{1}[0-9]{9}[02468]{1}$");

  @override
  TurkishIdentificationNumberValidationError? validator(String value) {
    return ('11111111111' == value || _turkishIdentificationNumberRegExp.hasMatch(value)) ? null : TurkishIdentificationNumberValidationError.invalid;
  }

}