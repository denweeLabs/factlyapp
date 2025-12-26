import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalSecureStorage {
  final FlutterSecureStorage _secureStorage;

  const LocalSecureStorage(this._secureStorage);

  Future<void> putString({required String key, required String? value}) async {
    return _secureStorage.write(key: key, value: value);
  }

  Future<String?> getString({required String key}) {
    return _secureStorage.read(key: key);
  }

  Future<void> remove({required String key}) async {
    return _secureStorage.delete(key: key);
  }
}