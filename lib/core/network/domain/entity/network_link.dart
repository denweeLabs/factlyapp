import 'package:formz/formz.dart';

enum NetworkLinkValidationError { empty, invalid }

class NetworkLink extends FormzInput<String, NetworkLinkValidationError> {
  const NetworkLink.pure([super.value = '']) : super.pure();
  const NetworkLink.dirty([super.value = '']) : super.dirty();

  static final _urlRegExp = RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$');

  @override
  NetworkLinkValidationError? validator(String value) {
    final trimValue = value.trim();

    if (trimValue.isEmpty) {
      return NetworkLinkValidationError.empty;
    } else if (!_urlRegExp.hasMatch(value)) {
      return NetworkLinkValidationError.invalid;
    }
    return null;
  }
}