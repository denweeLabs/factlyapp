import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_ad_failure.freezed.dart';

@freezed
abstract class AppAdFailure with _$AppAdFailure {
  const AppAdFailure._();

  const factory AppAdFailure.closed() = _Closed;
  const factory AppAdFailure.connection(String error) = _Connection;
  const factory AppAdFailure.noAdAvailable(String error) = _NoAdAvailable;
  const factory AppAdFailure.failedToLoad(String error) = _FailedToLoad;
  const factory AppAdFailure.failedToShow(String error) = _FailedToShow;
  const factory AppAdFailure.unexpected(String error) = _Unexpected;

  String get logMessage => when(
    closed: () => 'Closed',
    connection: (error) => 'Connection: $error',
    noAdAvailable: (error) => 'NoAdAvailable: $error',
    failedToLoad: (error) => 'FailedToLoad: $error',
    failedToShow: (error) => 'FailedToShow: $error',
    unexpected: (error) => 'Unexpected: $error',
  );
}
