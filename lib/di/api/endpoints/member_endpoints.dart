part of 'endpoints.dart';

class _MemberEndpoints {
  const _MemberEndpoints();

  static const _base = 'member';

  final login = '$_base/login';
  final loginThirdParty = '$_base/login_oauth';
  final register = '$_base/register';
  final thirdPartyRegister = '$_base/register_oauth';
  final signInAnonymously = '$_base/login_anonymously';
  final tokenUpdate = '$_base/token';
  final profile = '$_base/profile';
  final memberData = '$_base/bootstrap';
  final preferences = '$_base/preferences';
  final account = '$_base/account';
  final changePassword = '$_base/account/change_password';
  final resetPassword = '$_base/account/reset_password';
  final resetPasswordValidate = '$_base/account/reset_password/validate';
  final pushNotificationsSubscribe = '$_base/push_notifications/subscribe';
  final pushNotificationsUnsubscribe = '$_base/push_notifications/unsubscribe';
  final userStatistics = '$_base/statistics';
  final userSubscription = '$_base/subscription';
  final userIdentity = '$_base/identity';
  final applyBackground = '$_base/background/apply';
  final resetBackground = '$_base/background/reset';

  String backgrounds({String? languageCode}) {
    final url = '$_base/backgrounds';
    final uri = Uri.parse(url).replace(
      queryParameters: {
        if (languageCode != null) 'lang': languageCode,
      },
    );
    return uri.toString();
  }
}
