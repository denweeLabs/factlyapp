import 'package:denwee/core/backgrounds/domain/entity/background_selection_item.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackgroundSelectionUtil {
  /// Checks whether background item is selected
  static Widget isBackgroundItemSelected({
    required BackgroundSelectionItem item,
    required Widget Function(bool) builder,
  }) {
    return BlocSelector<UserPreferencesCubit, UserPreferencesState, UniqueId>(
      selector: (state) => state.preferences.background.selectedBackgroundId,
      builder: (context, selectedId) => builder(item.isSelected(selectedId)),
    );
  }
  
  /// Listens for user subscription
  static Widget isSubscribedProvider({required Widget Function(bool) builder}) {
    return BlocSelector<UserSubscriptionCubit, UserSubscriptionState, bool>(
      selector: (state) => state.isSubscribed,
      builder: (_, isSubscribed) => builder(isSubscribed),
    );
  }

  /// Checks whether background is unlocked
  static Widget isBackgroundUnlockedProvider({
    required UniqueId backgroundId,
    required Widget Function(bool) builder,
  }) {
    return BlocSelector<ProfileCubit, ProfileState, List<UniqueId>>(
      selector: (state) =>
          state.profile.toNullable()?.unlockedBackgrounds ?? [],
      builder: (_, unlockedBackgrounds) =>
          builder(unlockedBackgrounds.contains(backgroundId)),
    );
  }

  /// Checks current stars balance
  static Widget starsBalanceProvider({
    required Widget Function(int) builder,
  }) {
    return BlocSelector<UserStatisticsCubit, UserStatisticsState, int>(
      selector: (state) => state.statistics.stars,
      builder: (_, stars) => builder(stars),
    );
  }

  /// Listens whether current background is applying
  static Widget isBackgroundApplyingProvider({
    required UniqueId backgroundId,
    required Widget Function(bool) builder,
  }) {
    return BlocBuilder<ActiveBackgroundCubit, ActiveBackgroundState>(
      builder: (_, state) =>
          builder(state.applyingId.toNullable() == backgroundId),
    );
  }
}
