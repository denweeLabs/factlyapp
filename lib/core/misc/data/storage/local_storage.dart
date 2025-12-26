import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class LocalStorage {
  final SharedPreferences _sharedPreferences;

  const LocalStorage(this._sharedPreferences);

  Future<bool> putBool({required String key, required bool value}) async {
    return _sharedPreferences.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  Future<bool> putString({required String key, required String value}) async {
    return _sharedPreferences.setString(key, value);
  }

  String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  Future<bool> putInt({required String key, required int value}) async {
    return _sharedPreferences.setInt(key, value);
  }

  int? getInt({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  Future<bool> putDouble({required String key, required double value}) async {
    return _sharedPreferences.setDouble(key, value);
  }

  double? getDouble({required String key}) {
    return _sharedPreferences.getDouble(key);
  }

  Future<bool> putStringArray({required String key, required List<String> value}) async {
    return _sharedPreferences.setStringList(key, value);
  }

  List<String>? getStringArray({required String key}) {
    return _sharedPreferences.getStringList(key);
  }

  Future<bool> remove({required String key}) async {
    return _sharedPreferences.remove(key);
  }
}