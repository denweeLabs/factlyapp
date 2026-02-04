import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_subscription_response_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class GetUserSubscriptionResponseDto {
  final UserSubscriptionDto? active;

  const GetUserSubscriptionResponseDto({
    required this.active,
  });

  factory GetUserSubscriptionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetUserSubscriptionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserSubscriptionResponseDtoToJson(this);
}
