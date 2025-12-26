import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_permission_status.freezed.dart';

@freezed
abstract class AppPermissionStatus with _$AppPermissionStatus {
  const AppPermissionStatus._();
  const factory AppPermissionStatus.granted({@Default(false) bool isLimited}) = _Granted;
  const factory AppPermissionStatus.denied({@Default(false) bool isForever}) = _Denied;

  bool get isAnyGranted => isGranted || isLimited;

  bool get isAnyDenied => isDenied || isDeniedForever;

  bool get isGranted => maybeWhen(
        granted: (_) => true,
        orElse: () => false,
      );

  bool get isLimited => maybeWhen(
        granted: (isLimited) => isLimited,
        orElse: () => false,
      );

  bool get isDenied => maybeWhen(
        denied: (isForever) => !isForever,
        orElse: () => false,
      );

  bool get isDeniedForever => maybeWhen(
        denied: (isForever) => isForever,
        orElse: () => false,
      );
}
