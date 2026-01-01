import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_subscription_dto.g.dart';

/// This model used to retrieve subscription from backend.
/// Backend receive updates from RevenueCat via webhook and store actual data to database
@JsonSerializable()
@immutable
class UserSubscriptionDto {
  @JsonKey(name: 'package_id') final String packageId;
  @JsonKey(name: 'expires_at') final DateTime expiresAt;

  const UserSubscriptionDto({
    required this.packageId,
    required this.expiresAt,
  });

  factory UserSubscriptionDto.fromDomain(UserSubscription subscription) {
    return UserSubscriptionDto(
      packageId: subscription.packageType.packageId,
      expiresAt: subscription.expiresAt.toUtc(),
    );
  }

  UserSubscription toDomain() {
    return UserSubscription(
      packageType: PremiumPackageTypeX.fromPackageId(packageId),
      expiresAt: expiresAt.toLocal(),
    );
  }

  factory UserSubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserSubscriptionDtoToJson(this);
}
