import 'package:dartz/dartz.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_data.freezed.dart';

@freezed
abstract class MemberData with _$MemberData {
  const factory MemberData({
    required Profile profile,
    required UserStatistics statistics,
    required UserPreferences preferences,
    required Option<UserSubscription> activeSubscription,
    required List<UniqueId> archivedFactIds,
  }) = _MemberData;
}
