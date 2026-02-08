import 'package:denwee/core/facts/data/model/archive_list_result_dto.dart';
import 'package:denwee/core/facts/data/model/archived_fact_dto.dart';
import 'package:denwee/core/facts/data/model/daily_fact_dto.dart';
import 'package:denwee/core/facts/data/model/daily_facts_bucket_dto.dart';
import 'package:denwee/core/facts/data/model/fact_explanation_dto.dart';
import 'package:denwee/core/facts/data/source/remote/facts_api.dart';
import 'package:denwee/core/facts/domain/source/facts_remote_source.dart';
import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FactsRemoteSource)
class FactsRemoteSourceImpl implements FactsRemoteSource {
  final FactsApi _api;

  const FactsRemoteSourceImpl(this._api);

  @override
  Future<DailyFactsBucketDto> getDailyFactsBucket({
    String? languageCode,
    List<String>? interests,
  }) async {
    final response = await _api.getDailyFactsBucket(
      languageCode: languageCode,
      interests: interests,
    );
    return response.parseOrThrow(DailyFactsBucketDto.fromJson);
  }

  @override
  Future<FactExplanationDto> getFactExplanation(int id, bool useStars) async {
    final response = await _api.getFactExplanation(id.toString(), useStars);
    return response.parseOrThrow(FactExplanationDto.fromJson);
  }

  @override
  Future<bool> getFactExplanationRewardStatus(int id) async {
    final response = await _api.getFactExplanationRewardStatus(id.toString());
    return response.parseOrThrow((data) => data['reward_obtained'] ?? false);
  }

  @override
  Future<List<int>> getArchivedFactsIds() async {
    final response = await _api.getArchivedFactsIds();
    final items = response.parseOrThrow(
      (data) => data['items'] as List<Object?>,
    );
    return items.cast<int>();
  }

  @override
  Future<ArchiveListResultDto> getArchivedFactsList({
    required SortOrder sortOrder,
    required int count,
    required int page,
  }) async {
    final response = await _api.getArchivedFactsList(
      sortOrder: sortOrder,
      count: count,
      page: page,
    );
    final data = response.parseOrThrow((json) => json);
    final items = (data['items'] as List<Object?>)
        .map((e) => ArchivedFactDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return ArchiveListResultDto(
      items: items,
      total: data['total'],
      page: data['page'],
    );
  }

  @override
  Future<void> storeFactToArchive(int id) async {
    final response = await _api.storeFactToArchive(id);
    return response.successOrThrow();
  }

  @override
  Future<void> deleteArchivedFact(int id) async {
    final response = await _api.deleteArchivedFact(id);
    return response.successOrThrow();
  }

  @override
  Future<DailyFactDto> getDailyFactById(int id) async {
    final response = await _api.getDailyFactById(id.toString());
    return response.parseOrThrow(DailyFactDto.fromJson);
  }
}
