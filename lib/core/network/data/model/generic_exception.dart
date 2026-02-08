import 'app_exception.dart';

class GenericException implements AppException {
  final String code;
  final String message;

  const GenericException({
    required this.code,
    required this.message,
  });

  @override
  String toString() => '$GenericException: $code;$message';
}
