import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';
import 'package:denwee/core/subscriptions/data/source/remote/subscriptions_remote_source.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubscriptionsRemoteSource)
class SubscriptionsRemoteSourceImpl implements SubscriptionsRemoteSource {
  final RequestExecutor _requestExecutor;

  const SubscriptionsRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<UserSubscriptionDto?> getSubscription() async {
    final response = await _requestExecutor.get(
      Endpoints.member.userSubscription,
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      final activeSubscription = data['active'] as Map<String, dynamic>?;
      return activeSubscription != null
          ? UserSubscriptionDto.fromJson(activeSubscription)
          : null;
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }
}
