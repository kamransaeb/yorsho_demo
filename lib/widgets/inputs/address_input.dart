import 'package:formz/formz.dart';

enum AddressValidationError {
  invalid,
}

class AddressInput extends FormzInput<String, AddressValidationError> {

  const AddressInput.pure() : super.pure('');

  const AddressInput.dirty([super.value = '']) : super.dirty();

  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  @override
  AddressValidationError? validator(String value) {
    return value.length > 5 ? null : AddressValidationError.invalid;
  }
  
}