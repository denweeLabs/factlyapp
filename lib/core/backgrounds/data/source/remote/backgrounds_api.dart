import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class BackgroundsEndpoints {
  static const _base = '/member';

  static const apply = '$_base/background/apply';
  static const reset = '$_base/background/reset';

  static String backgrounds({String? languageCode}) {
    final url = '$_base/backgrounds';
    final params = languageCode != null ? {'lang': languageCode} : null;
    final uri = Uri.parse(url).replace(queryParameters: params);
    return uri.toString();
  }
}

@LazySingleton()
class BackgroundsApi {
  final RequestExecutor _client;

  const BackgroundsApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getBackgrounds({String? languageCode}) {
    return _client.get(
      BackgroundsEndpoints.backgrounds(languageCode: languageCode),
    );
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> applyBackground(Map<String, dynamic> body) {
    return _client.post(BackgroundsEndpoints.apply, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> resetBackground() {
    return _client.post(BackgroundsEndpoints.reset, body: null);
  }
}
