import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';
import 'package:denwee/core/subscriptions/data/source/remote/subscriptions_api.dart';
import 'package:denwee/core/subscriptions/domain/source/subscriptions_remote_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubscriptionsRemoteSource)
class SubscriptionsRemoteSourceImpl implements SubscriptionsRemoteSource {
  final SubscriptionsApi _api;

  const SubscriptionsRemoteSourceImpl(this._api);

  @override
  Future<UserSubscriptionDto?> getSubscription() async {
    final response = await _api.getSubscription();
    return response.parseOrThrow((data) {
      final active = data['active'] as Map<String, dynamic>?;
      return active != null ? UserSubscriptionDto.fromJson(active) : null;
    });
  }
}
