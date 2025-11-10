import 'package:formz/formz.dart';

enum GroupNameValidationError {
  invalid,
}

class GroupNameInput extends FormzInput<String, GroupNameValidationError> {

  const GroupNameInput.pure() : super.pure('');
  const GroupNameInput.dirty([super.value = '']) : super.dirty();
  // static final RegExp _nameRegExp = RegExp(
  //   r'/^[a-zA-Z]{3,}$/',
  // );

  @override
  GroupNameValidationError? validator(String value) {
    //return value.length > 10 ? null : GroupNameValidationError.invalid;
    return null;
  }
  
}