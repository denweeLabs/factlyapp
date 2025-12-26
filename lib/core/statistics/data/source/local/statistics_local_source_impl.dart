import 'dart:convert';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';
import 'package:denwee/core/statistics/data/source/local/statistics_local_source.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StatisticsLocalSource)
class StatisticsLocalSourceImpl implements StatisticsLocalSource {
  final LocalStorage _localStorage;
  final String _envPrefix;

  const StatisticsLocalSourceImpl(
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _key => '${_envPrefix}STATISTICS';

  @override
  UserStatisticsDto? get() {
    final jsonString = _localStorage.getString(key: _key);
    if (jsonString != null && jsonString.isNotEmpty) {
      final data = jsonDecode(jsonString) as Map<String, dynamic>?;
      if (data != null) return UserStatisticsDto.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> store(UserStatisticsDto dto) async {
    final jsonString = jsonEncode(dto.toJson());
    await _localStorage.putString(key: _key, value: jsonString);
  }

  @override
  Future<void> delete() async {
    await _localStorage.remove(key: _key);
  }
}
