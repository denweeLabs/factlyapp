import 'dart:async';

import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/presentation/bloc/facts/facts_archive_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
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
    final (failure, memberData) = failureOrSuccess.getEntries();

    // if failure
    if (failure != null) {
      _profileCubit.raiseFailure(failure);
    }

    // if success
    else if (memberData != null) {
      
      /// Update and store user profile
      unawaited(
        _profileCubit.emitPreserveProfile(memberData.profile),
      );

      /// Update and store user preferences
      unawaited(
        _preferencesCubit.emitPreservePreferences(
          memberData.preferences,
          remotePreserve: false,
        ),
      );

      /// Update and store user statistics
      unawaited(
        _statisticsCubit.emitPreserveStatistics(
          memberData.statistics,
        ),
      );

      /// Update and store archived fact identifiers
      unawaited(
        _factsArchiveCubit.emitPreserveArchivedIds(
          memberData.archivedFactIds,
        ),
      );

      /// Update and store active subscription (if present)
      final activeSubscription =
          memberData.activeSubscription.toNullable();

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