import 'dart:async';

import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/user_subscription_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class GetMemberDataUseCase {
  final ProfileRepo _profileRepo;
  final ProfileCubit _profileCubit;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _statisticsCubit;
  final UserSubscriptionCubit _subscriptionCubit;
  final FactsArchiveCubit _factsArchiveCubit;

  const GetMemberDataUseCase(
    this._profileRepo,
    this._profileCubit,
    this._preferencesCubit,
    this._statisticsCubit,
    this._subscriptionCubit,
    this._factsArchiveCubit,
  );


  /// Executes the member data bootstrap flow.
  ///
  /// Responsibilities:
  /// - Fetch the latest member-related data from the backend
  /// - Synchronize remote profile, preferences, and statistics locally
  /// - Restore archived facts and active subscription state
  /// - Propagate failures to the profile state layer
  ///
  /// This method is typically executed:
  /// - On app launch for authenticated users
  ///
  /// All successful state updates are performed asynchronously
  /// to keep the UI responsive.
  /// 
  Future<void> execute() async {
    final failureOrSuccess = await _profileRepo.getMemberDataRemote();
    final entries = failureOrSuccess.getEntries();

    // if failure
    if (entries.$1 != null) {
      _profileCubit.raiseFailure(entries.$1!);
    }

    // if success
    else {
      
      /// Update and store user profile
      unawaited(
        _profileCubit.emitPreserveProfile(entries.$2!.profile),
      );

      /// Update and store user preferences
      unawaited(
        _preferencesCubit.emitPreservePreferences(
          entries.$2!.preferences,
          remotePreserve: false,
        ),
      );

      /// Update and store user statistics
      unawaited(
        _statisticsCubit.emitPreserveStatistics(
          entries.$2!.statistics,
        ),
      );

      /// Update and store archived fact identifiers
      unawaited(
        _factsArchiveCubit.emitPreserveArchivedIds(
          entries.$2!.archivedFactIds,
        ),
      );

      /// Update and store active subscription (if present)
      final activeSubscription =
          entries.$2!.activeSubscription.toNullable();

      if (activeSubscription != null) {
        unawaited(
          _subscriptionCubit.emitPreserveSubscription(
            activeSubscription,
          ),
        );
      }
    }
  }
}