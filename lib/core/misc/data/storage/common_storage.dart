import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CommonStorage {
  final LocalStorage _localStorage;
  final String _envPrefix;

  CommonStorage(
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _appLaunchCounterKey => '${_envPrefix}APP_LAUNCH_COUNTER';
  String get _isOnboardingKey => '${_envPrefix}IS_ONBOARDING';
  String get _isAdvertismentAlertViewedKey => '${_envPrefix}IS_AD_ALERT_VIEWED';
  String get _addToArchiveCounterKey => '${_envPrefix}ADD_TO_ARCHIVE_COUNTER';
  String get _isShowcaseDisplayedKey => '${_envPrefix}SHOWCASE_DISPLAYED';

  bool isOnboardingState() {
    final state = _localStorage.getBool(key: _isOnboardingKey);
    return state ?? true;
  }

  Future<void> setIsOnboardingState(bool value) async {
    await _localStorage.putBool(key: _isOnboardingKey, value: value);
  }

  bool isShowcaseDisplayed() {
    final state = _localStorage.getBool(key: _isShowcaseDisplayedKey);
    return state ?? false;
  }

  Future<void> setIsShowcaseDisplayed(bool value) async {
    await _localStorage.putBool(key: _isShowcaseDisplayedKey, value: value);
  }

  int appLaunchCounter() {
    final state = _localStorage.getInt(key: _appLaunchCounterKey);
    return state ?? 0;
  }

  Future<int> increaseAppLaunchCounter() async {
    final state = appLaunchCounter();
    final newState = state + 1;
    await _localStorage.putInt(key: _appLaunchCounterKey, value: newState);
    return newState;
  }

  bool isAdvertismentAlertViewed() {
    final state = _localStorage.getBool(key: _isAdvertismentAlertViewedKey);
    return state ?? false;
  }

  Future<void> setAdvertismentAlertViewed(bool value) async {
    await _localStorage.putBool(key: _isAdvertismentAlertViewedKey, value: value);
  }

  int currentAddToArchiveCount() {
    final state = _localStorage.getInt(key: _addToArchiveCounterKey);
    return state ?? 0;
  }

  Future<int> increaseAddToArchiveCounter() async {
    final state = currentAddToArchiveCount();
    final newState = state + 1;
    await _localStorage.putInt(key: _addToArchiveCounterKey, value: newState);
    return newState;
  }

  Future<void> resetAddToArchiveCounter() async {
    await _localStorage.remove(key: _addToArchiveCounterKey);
  }
}