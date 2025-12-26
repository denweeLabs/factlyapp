import 'package:denwee/core/facts/data/model/archive_list_result_dto.dart';
import 'package:denwee/core/facts/data/model/archived_fact_dto.dart';
import 'package:denwee/core/facts/data/model/daily_facts_bucket_dto.dart';
import 'package:denwee/core/facts/data/model/fact_explanation_dto.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source.dart';
import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

enum SortOrder { ascending, descending }

extension SortOrderX on SortOrder {
  String get apiType {
    switch (this) {
      case SortOrder.ascending: return 'asc';
      case SortOrder.descending: return 'desc';
    }
  }
}

@LazySingleton(as: FactsRemoteSource)
class FactsRemoteSourceImpl implements FactsRemoteSource {
  final RequestExecutor _requestExecutor;

  const FactsRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<DailyFactsBucketDto> getDailyFactsBucket(
      {String? languageCode, List<String>? interests}) async {
    final endpoint = Endpoints.facts.dailyFactsBucket(
      languageCode: languageCode,
      interests: interests,
    );
    final response = await _requestExecutor.get(endpoint);
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      return DailyFactsBucketDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<FactExplanationDto> getFactExplanation(int id, bool useStars) async {
    final body = { "use_stars": useStars };
    final response = await _requestExecutor.post(
      Endpoints.facts.factExplanation(id.toString()),
      body: body,
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      return FactExplanationDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<bool> getFactExplanationRewardStatus(int id) async {
    final response = await _requestExecutor.get(
      Endpoints.facts.factExplanationRewardStatus(id.toString()),
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      return data['reward_obtained'] ?? false;
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<List<int>> getArchivedFactsIds() async {
    final response = await _requestExecutor.get(
      Endpoints.facts.archive,
    );
    if (response.isSuccessful) {
      final data = (response.data as List<Object?>).cast<int>();
      return data.toList();
    } else {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<ArchiveListResultDto> getArchivedFactsList({
    required SortOrder sortOrder,
    required int count,
    required int page,
  }) async {
    final response = await _requestExecutor.get(
      Endpoints.facts.archiveList(
        sortOrder: sortOrder,
        count: count,
        page: page,
      ),
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      final items = (data['items'] as List<dynamic>)
          .map((e) => ArchivedFactDto.fromJson(e as Map<String, dynamic>))
          .toList();
      final total = data['total'];
      final page = data['page'];
      return ArchiveListResultDto(
        items: items,
        total: total,
        page: page,
      );
    } else {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> storeFactToArchive(int id) async {
    final body = {'id': id};
    final response = await _requestExecutor.post(
      Endpoints.facts.archive,
      body: body,
    );
    if (!response.isSuccessful) {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> deleteArchivedFact(int id) async {
    final response = await _requestExecutor.delete(
      Endpoints.facts.deleteArchivedFact(id),
    );
    if (!response.isSuccessful) {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }
}
