import 'dart:convert';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';
import 'package:denwee/core/subscriptions/data/source/local/subscriptions_local_source.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubscriptionsLocalSource)
class SubscriptionsLocalSourceImpl implements SubscriptionsLocalSource {
  final LocalStorage _localStorage;
  final String _envPrefix;

  const SubscriptionsLocalSourceImpl(
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _key => '${_envPrefix}SUBSCRIPTION';

  @override
  UserSubscriptionDto? get() {
    final jsonString = _localStorage.getString(key: _key);
    if (jsonString != null && jsonString.isNotEmpty) {
      final data = jsonDecode(jsonString) as Map<String, dynamic>?;
      if (data != null) return UserSubscriptionDto.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> store(UserSubscriptionDto dto) async {
    final jsonString = jsonEncode(dto.toJson());
    await _localStorage.putString(key: _key, value: jsonString);
  }

  @override
  Future<void> delete() async {
    await _localStorage.remove(key: _key);
  }
}
