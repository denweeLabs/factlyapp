import 'package:denwee/core/facts/data/model/daily_facts_bucket_dto.dart';
import 'package:denwee/core/facts/data/model/fact_explanation_dto.dart';

abstract class FactsLocalSource {
  ///
  /// Get daily bucket
  DailyFactsBucketDto? getDailyBucket();

  ///
  /// Store daily bucket
  Future<void> storeDailyBucket(DailyFactsBucketDto dto);

  ///
  /// Delete daily bucket
  Future<void> deleteDailyBucket();

  ///
  /// Get fact details
  Future<FactExplanationDto?> getFactExplanation(int id);

  ///
  /// Upsert fact details
  Future<void> storeFactExplanation(FactExplanationDto dto);

  ///
  /// Delete all fact explanations
  Future<void> deleteFactExplanations();

  ///
  /// Get list of facts from archive
  List<int> getArchivedFactsIds();

  ///
  /// Store list of facts to archive
  Future<void> storeFactsIdsToArchive(List<int> ids);

  ///
  /// Store single fact to archive
  Future<void> storeFactToArchive(int id);

  ///
  /// Delete single fact from archive
  Future<void> deleteFactFromArchive(int id);

  ///
  /// Delete list of all archived facts
  Future<void> deleteArchivedFacts();
}
