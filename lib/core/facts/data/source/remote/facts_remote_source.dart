import 'package:denwee/core/facts/data/model/archive_list_result_dto.dart';
import 'package:denwee/core/facts/data/model/daily_facts_bucket_dto.dart';
import 'package:denwee/core/facts/data/model/fact_explanation_dto.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source_impl.dart';
import 'package:denwee/core/network/data/exceptions/connection_exception.dart';

abstract class FactsRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<DailyFactsBucketDto> getDailyFactsBucket({String? languageCode, List<String>? interests});

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<FactExplanationDto> getFactExplanation(int id, bool useStars);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<bool> getFactExplanationRewardStatus(int id);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<List<int>> getArchivedFactsIds();

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<ArchiveListResultDto> getArchivedFactsList({
    required SortOrder sortOrder,
    required int count,
    required int page,
  });

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> storeFactToArchive(int id);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> deleteArchivedFact(int id);
}
