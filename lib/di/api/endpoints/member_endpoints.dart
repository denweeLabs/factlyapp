part of 'endpoints.dart';

class _MemberEndpoints {
  const _MemberEndpoints();

  static const _base = 'member';

  final login = '$_base/login';
  final register = '$_base/register';
  final signInAnonymously = '$_base/login_anonymously';
  final tokenUpdate = '$_base/token';
  final profile = '$_base/profile';
  final preferences = '$_base/preferences';
  final account = '$_base/account';
  final changePassword = '$_base/account/change_password';
  final resetPassword = '$_base/account/reset_password';
  final resetPasswordValidate = '$_base/account/reset_password/validate';
  final pushNotificationsSubscribe = '$_base/push_notifications/subscribe';
  final pushNotificationsUnsubscribe = '$_base/push_notifications/unsubscribe';
  final userStatistics = '$_base/statistics';
}
