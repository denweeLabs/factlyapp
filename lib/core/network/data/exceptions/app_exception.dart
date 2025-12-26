import 'package:denwee/core/network/data/exceptions/authorization_exception.dart';
import 'package:denwee/core/network/data/exceptions/connection_exception.dart';
import 'package:denwee/core/network/data/exceptions/generic_exception.dart';

abstract class AppException {}

extension AppExceptionX on AppException {
  T map<T>({
    required Function(GenericException) generic,
    required Function(ConnectionException) connection,
    required Function(AuthorizationException) authorization,
  }) {
    if (this is GenericException) {
      return generic(this as GenericException);
    }
    if (this is ConnectionException) {
      return connection(this as ConnectionException);
    }
    if (this is AuthorizationException) {
      return authorization(this as AuthorizationException);
    }
    throw 'Unsupported exception';
  }
}
