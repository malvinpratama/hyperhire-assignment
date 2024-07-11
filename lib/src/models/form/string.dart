import 'package:formz/formz.dart';

enum StringValidationError { invalid }

final class StringForm extends FormzInput<String, StringValidationError> {
  const StringForm.pure() : super.pure('');
  const StringForm.dirty({String value = ''}) : super.dirty(value);

  @override
  StringValidationError? validator(String? value) {
    return (value ?? '').isNotEmpty ? null : StringValidationError.invalid;
  }
}
