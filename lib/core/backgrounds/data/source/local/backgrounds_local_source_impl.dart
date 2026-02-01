import 'dart:convert';

import 'package:denwee/core/backgrounds/data/model/available_background_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_category_dto.dart';
import 'package:denwee/core/backgrounds/data/model/resolved_background_asset_dto.dart';
import 'package:denwee/core/backgrounds/data/source/local/backgrounds_local_source.dart';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BackgroundsLocalSource)
class BackgroundsLocalSourceImpl implements BackgroundsLocalSource {
  final LocalStorage _localStorage;
  final String _envPrefix;

  const BackgroundsLocalSourceImpl(
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _backgroundsKey => '${_envPrefix}AVAILABLE_BACKGROUNDS';
  String get _categoriesKey => '${_envPrefix}BACKGROUND_CATEGORIES';
  String get _backgroundAssetKey => '${_envPrefix}BACKGROUND_ASSET';

  @override
  List<AvailableBackgroundDto> getBackgrounds() {
    final jsonString = _localStorage.getString(key: _backgroundsKey);
    if (jsonString != null && jsonString.isNotEmpty) {
      final json = (jsonDecode(jsonString) as List<dynamic>).cast<Map<String, dynamic>>();
      return json.map(AvailableBackgroundDto.fromJson).toList();
    }
    return const <AvailableBackgroundDto>[];
  }

  @override
  List<BackgroundCategoryDto> getBackgroundCategories() {
    final jsonString = _localStorage.getString(key: _categoriesKey);
    if (jsonString != null && jsonString.isNotEmpty) {
      final json = (jsonDecode(jsonString) as List<dynamic>).cast<Map<String, dynamic>>();
      return json.map(BackgroundCategoryDto.fromJson).toList();
    }
    return const <BackgroundCategoryDto>[];
  }

  @override
  ResolvedBackgroundAssetDto? getBackgroundAsset() {
    final jsonString = _localStorage.getString(key: _backgroundAssetKey);
    if (jsonString != null && jsonString.isNotEmpty) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ResolvedBackgroundAssetDto.fromJson(json);
    }
    return null;
  }

  @override
  Future<void> storeBackgrounds(List<AvailableBackgroundDto> data) async {
    final json = data.map((e) => e.toJson()).toList();
    final value = jsonEncode(json);
    await _localStorage.putString(key: _backgroundsKey, value: value);
  }

  @override
  Future<void> storeBackgroundCategories(List<BackgroundCategoryDto> data) async {
    final json = data.map((e) => e.toJson()).toList();
    final value = jsonEncode(json);
    await _localStorage.putString(key: _categoriesKey, value: value);
  }

  @override
  Future<void> storeBackgroundAsset(ResolvedBackgroundAssetDto data) async {
    final json = data.toJson();
    final value = jsonEncode(json);
    await _localStorage.putString(key: _backgroundAssetKey, value: value);
  }
  
  @override
  Future<void> deleteBackgrounds() async {
    await _localStorage.remove(key: _backgroundsKey);
  }

  @override
  Future<void> deleteCategories() async {
    await _localStorage.remove(key: _categoriesKey);
  }

  @override
  Future<void> deleteBackgroundAsset() async {
    await _localStorage.remove(key: _backgroundAssetKey);
  }
}
