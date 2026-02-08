import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

enum SortOrder { ascending, descending }

extension SortOrderX on SortOrder {
  String get apiType {
    switch (this) {
      case SortOrder.ascending:
        return 'asc';
      case SortOrder.descending:
        return 'desc';
    }
  }
}

abstract class FactsEndpoints {
  static const _base = '/facts';

  static const archive = '$_base/archive';

  static String dailyFactsBucket({
    String? languageCode,
    List<String>? interests,
  }) {
    final url = '$_base/daily/bucket';
    final languageParam = languageCode != null ? {'lang': languageCode} : null;
    final interestsParam = (interests ?? []).isNotEmpty
        ? {'interests': interests!.join(',')}
        : null;
    final uri = Uri.parse(url)
      .replace(queryParameters: {...?languageParam, ...?interestsParam});
    return uri.toString();
  }

  static String factExplanation(String id) => '$_base/explanation/$id';
  static String factExplanationRewardStatus(String id) => '$_base/explanation/check_reward/$id';
  static String deleteArchivedFact(int id) => '$_base/archive/$id';
  static String dailyFact(String id) => '$_base/daily/fact/$id';

  static String archiveList({
    required SortOrder sortOrder,
    required int count,
    required int page,
  }) {
    final url = '$_base/archive/list';
    final params = {
      'sort': sortOrder.apiType,
      'count': count.toString(),
      'page': page.toString(),
    };
    final uri = Uri.parse(url).replace(queryParameters: params);
    return uri.toString();
  }
}

@LazySingleton()
class FactsApi {
  final RequestExecutor _client;

  const FactsApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getDailyFactsBucket({
    String? languageCode,
    List<String>? interests,
  }) {
    return _client.get(
      FactsEndpoints.dailyFactsBucket(
        languageCode: languageCode,
        interests: interests,
      ),
    );
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getFactExplanation(String id, bool useStars) {
    return _client.post(
      FactsEndpoints.factExplanation(id),
      body: {'use_stars': useStars},
    );
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getFactExplanationRewardStatus(String id) {
    return _client.get(FactsEndpoints.factExplanationRewardStatus(id));
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getArchivedFactsIds() {
    return _client.get(FactsEndpoints.archive);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getArchivedFactsList({
    required SortOrder sortOrder,
    required int count,
    required int page,
  }) {
    return _client.get(
      FactsEndpoints.archiveList(
        sortOrder: sortOrder,
        count: count,
        page: page,
      ),
    );
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> storeFactToArchive(int id) {
    return _client.post(FactsEndpoints.archive, body: {'id': id});
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> deleteArchivedFact(int id) {
    return _client.delete(FactsEndpoints.deleteArchivedFact(id));
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getDailyFactById(String id) {
    return _client.get(FactsEndpoints.dailyFact(id));
  }
}
