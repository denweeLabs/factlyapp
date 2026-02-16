import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class BackgroundCardSelectionVM {
  final UniqueId selectedId;
  final UniqueId? applyingId;
  final Set<UniqueId> unlockedIds;
  final bool hasPremiumSubscription;

  const BackgroundCardSelectionVM({
    required this.selectedId,
    required this.applyingId,
    required this.unlockedIds,
    required this.hasPremiumSubscription,
  });
}

class BackgroundCardSelectionProviders extends StatelessWidget {
  const BackgroundCardSelectionProviders({super.key, required this.builder});

  final Widget Function(BuildContext, BackgroundCardSelectionVM) builder;

  @override
  Widget build(BuildContext context) {
    ///
    /// Selected background id
    /// 
    return BlocSelector<UserPreferencesCubit, UserPreferencesState, UniqueId>(
      selector: (state) => state.preferences.background.selectedBackgroundId,
      builder: (context, selectedBackgroundId) {
        ///
        /// Has Premium subscription
        /// 
        return BlocSelector<UserSubscriptionCubit, UserSubscriptionState, bool>(
          selector: (state) => state.isSubscribed,
          builder: (context, isSubscribed) {
            ///
            /// Unlocked background ids
            /// 
            return BlocSelector<ProfileCubit, ProfileState, Set<UniqueId>>(
              selector: (state) => state.profile.toNullable()?.unlockedBackgrounds ?? const <UniqueId>{},
              builder: (context, unlockedBackgroundIds) {
                ///
                /// Applying background id
                /// 
                return BlocSelector<ActiveBackgroundCubit, ActiveBackgroundState, UniqueId?>(
                  selector: (state) => state.applyingId.toNullable(),
                  builder: (context, applyingId) {
                    ///
                    ///
                    final data = BackgroundCardSelectionVM(
                      selectedId: selectedBackgroundId,
                      applyingId: applyingId,
                      unlockedIds: unlockedBackgroundIds,
                      hasPremiumSubscription: isSubscribed,
                    );
                    return builder(context, data);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}