import 'dart:convert';
import 'package:denwee/core/facts/data/model/daily_facts_bucket_dto.dart';
import 'package:denwee/core/facts/data/model/fact_explanation_dto.dart';
import 'package:denwee/core/facts/data/source/local/facts_local_source.dart';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/db/daos/fact_explanations_dao.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FactsLocalSource)
class FactsLocalSourceImpl implements FactsLocalSource {
  final FactExplanationsDao _factExplanationsDao;
  final LocalStorage _localStorage;
  final String _envPrefix;

  const FactsLocalSourceImpl(
    this._factExplanationsDao,
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _dailyFactsBucketKey => '${_envPrefix}DAILY_FACTS_BUCKET';
  String get _archivedFactsKey => '${_envPrefix}ARCHIVED_FACTS';

  @override
  DailyFactsBucketDto? getDailyBucket() {
    final jsonString = _localStorage.getString(key: _dailyFactsBucketKey);
    if (jsonString != null && jsonString.isNotEmpty) {
      final data = jsonDecode(jsonString) as Map<String, dynamic>?;
      if (data != null) return DailyFactsBucketDto.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> storeDailyBucket(DailyFactsBucketDto dto) async {
    final jsonString = jsonEncode(dto.toJson());
    await _localStorage.putString(key: _dailyFactsBucketKey, value: jsonString);
  }

  @override
  Future<void> deleteDailyBucket() async {
    await _localStorage.remove(key: _dailyFactsBucketKey);
  }

  @override
  Future<FactExplanationDto?> getFactExplanation(int id) async {
    final db = await _factExplanationsDao.getFactDetails(id);
    if (db == null) return null;
    return FactExplanationDto.fromDbModel(db);
  }

  @override
  Future<void> storeFactExplanation(FactExplanationDto dto) async {
    final db = dto.toDbCompanion();
    return _factExplanationsDao.upsertFactDetails(db);
  }

  @override
  Future<void> deleteFactExplanations() async {
    return _factExplanationsDao.deleteAll();
  }

  @override
  List<int> getArchivedFactsIds() {
    final jsonString = _localStorage.getString(key: _archivedFactsKey);
    if (jsonString != null && jsonString.isNotEmpty) {
      final data = (jsonDecode(jsonString) as List<dynamic>?)?.cast<int>();
      if (data != null) return data.toList();
    }
    return <int>[];
  }

  @override
  Future<void> storeFactsIdsToArchive(List<int> ids) async {
    final jsonString = jsonEncode(ids);
    await _localStorage.putString(key: _archivedFactsKey, value: jsonString);
  }

  @override
  Future<void> storeFactToArchive(int id) async {
    final archivedFacts = [...getArchivedFactsIds()];
    final index = archivedFacts.indexWhere((e) => e == id);
    if (index != -1) {
      archivedFacts[index] = id;
    } else {
      archivedFacts.add(id);
    }
    await storeFactsIdsToArchive(archivedFacts);
  }

  @override
  Future<void> deleteFactFromArchive(int id) async {
    final archivedFacts = [...getArchivedFactsIds()]..removeWhere((e) => e == id);
    await storeFactsIdsToArchive(archivedFacts);
  }

  @override
  Future<void> deleteArchivedFacts() async {
    await _localStorage.remove(key: _archivedFactsKey);
  }
}
