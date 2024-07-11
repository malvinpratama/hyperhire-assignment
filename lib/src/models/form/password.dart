import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

final class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty({String value = ''}) : super.dirty(value);

  // static const _atLeastOneUpperCase = '(?=.*[A-Z])';
  // static const _atLeastOneLowerCase = '(?=.*[a-z])';
  // static const _atLeastOneDigit = '(?=.*?[0-9])';
  // static const _atLeastOneSpecialChara = '(?=.*?[!@#\$&*~])';
  // static const _mustBeAtLeast8Chara = '.{8,}';

  // static final _passwordRegex = RegExp(r'^'
  //     '$_atLeastOneUpperCase$_atLeastOneLowerCase$_atLeastOneDigit$_atLeastOneSpecialChara$_mustBeAtLeast8Chara\$');

//   r'^
//   (?=.*[A-Z])       should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length
//   $

  @override
  PasswordValidationError? validator(String? value) {
    // return _passwordRegex.hasMatch(value ?? '')
    //     ? null
    //     : PasswordValidationError.invalid;
    return value!.isNotEmpty
        ? null
        : PasswordValidationError.invalid;
  }
}
