import 'package:dartz/dartz.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/profile/domain/entity/member_data.dart';
import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';
import 'package:denwee/core/subscriptions/data/model/get_user_subscription_response_dto.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_data_response_dto.g.dart';

@JsonSerializable(createToJson: false)
@immutable
class MemberDataResponseDto {
  final ProfileDto profile;
  final UserPreferencesDto preferences;
  final UserStatisticsDto statistics;
  final GetUserSubscriptionResponseDto subscription;
  @JsonKey(name: 'archived_fact_ids') final List<int> archivedFactIds;

  const MemberDataResponseDto({
    required this.profile,
    required this.preferences,
    required this.statistics,
    required this.subscription,
    required this.archivedFactIds,
  });

  factory MemberDataResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDataResponseDtoFromJson(json);

  MemberData toDomain() => MemberData(
    profile: profile.toDomain(),
    preferences: preferences.toDomain(),
    statistics: statistics.toDomain(),
    activeSubscription: optionOf(subscription.active?.toDomain()),
    archivedFactIds: archivedFactIds.map(UniqueId.fromValue).toList(),
  );
}
