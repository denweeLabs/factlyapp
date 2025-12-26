import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/use_case/ad_fact_explanation_use_case.dart';
import 'package:denwee/core/facts/domain/use_case/check_fact_explanation_use_case.dart';
import 'package:denwee/core/facts/domain/use_case/star_fact_explanation_use_case.dart';
import 'package:denwee/core/facts/domain/use_case/fact_explanation_util_use_case.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

part 'fact_explanation_state.dart';
part 'fact_explanation_cubit.freezed.dart';

@Injectable()
class FactExplanationCubit extends Cubit<FactExplanationState> {
  final AnalyticsRepo _analyticsRepo;
  final ProfileCubit _profileCubit;
  final UserStatisticsCubit _userStatisticsCubit;
  final CommonStorage _commonStorage;
  final AdFactExplanationUseCase _adFactExplanationUseCase;
  final StarFactExplanationUseCase _starFactExplanationUseCase;
  final FactExplanationUtilUseCase _factExplanationUtilUseCase;
  final CheckFactExplanationUseCase _checkFactExplanationUseCase;

  FactExplanationCubit(
    @factoryParam this.fact,
    this._analyticsRepo,
    this._profileCubit,
    this._userStatisticsCubit,
    this._commonStorage,
    this._adFactExplanationUseCase,
    this._starFactExplanationUseCase,
    this._factExplanationUtilUseCase,
    this._checkFactExplanationUseCase,
  ) : super(FactExplanationState.initial());

  late final DailyFact fact;
  late final StreamController<String> explanationController = StreamController.broadcast();
  StreamSubscription<String>? explanationSubscription;

  @override
  void emit(FactExplanationState state) {
    if (!isClosed) super.emit(state);
  }

  Future<void> checkFactExplanation() async {
    if (state.factExplanationChecked || state.checkingFactExplanation) {
      return;
    }
    emit(state.copyWith(
      checkingFactExplanation: true,
      factExplanationChecked: false,
    ));
    final explanation = await _checkFactExplanationUseCase.execute(
      fact.id,
    );
    emit(state.copyWith(
      explanation: explanation,
      checkingFactExplanation: false,
      factExplanationChecked: true,
    ));
  }

  Future<void> adExplainFact(Future<bool?> Function() dialogCallback) async {
    /// Ensure alert dialog is shown to the user
    await _showAdAlertDialog(dialogCallback);

    /// Update state
    emit(state.copyWith(
      loadingFactExplanation: true,
      factExplanationLoaded: false,
      failure: const None(),
    ));

    /// Perform
    final explanation = (await _adFactExplanationUseCase.execute(
      factId: fact.id,
      profileId: _profileCubit.state.profile.toNullable()!.id,
    )).getEntries();

    // If success -> check user statistics
    if (explanation.$2 != null) {
      _userStatisticsCubit.checkStatistics();
    }

    /// Update state
    return _finishEmit(
      failure: explanation.$1,
      explanation: explanation.$2,
    );
  }

  Future<void> starExplainFact() async {
    /// Update state
    emit(state.copyWith(
      loadingFactExplanation: true,
      factExplanationLoaded: false,
      failure: const None(),
    ));

    /// Perform
    final explanation = (await _starFactExplanationUseCase.execute(
      factId: fact.id,
    )).getEntries();

    // If success -> check user statistics
    if (explanation.$2 != null) {
      _userStatisticsCubit.checkStatistics();
    }

    /// Update state
    return _finishEmit(
      failure: explanation.$1,
      explanation: explanation.$2,
    );
  }

  void _finishEmit({FactsFailure? failure, FactExplanation? explanation}) {
    emit(state.copyWith(
      failure: optionOf(failure),
      factExplanationLoaded: explanation != null,
      loadingFactExplanation: false,
    ));
    if (explanation != null) {
      _listenToExplanationStream(explanation);
    }
  }

  Future<void> _showAdAlertDialog(
    Future<bool?> Function() dialogCallback,
  ) async {
    if (_commonStorage.isAdvertismentAlertViewed()) return;
    _commonStorage.setAdvertismentAlertViewed(true);

    await dialogCallback();

    // for iOS request permission for IDFA, if success log it to analytics
    if (Platform.isIOS) {
      final status = await AppTrackingTransparency.requestTrackingAuthorization();
      if (status == TrackingStatus.authorized) {
        _analyticsRepo.logIosAdTrackingAllowed();
      }
    }

    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  void _listenToExplanationStream(FactExplanation explanation) {
    final mappedStream = _factExplanationUtilUseCase.createStream(explanation.content);
    explanationSubscription?.cancel();
    explanationSubscription = mappedStream.listen(
      explanationController.add,
      onDone: () => emit(state.copyWith(explanation: Some(explanation))),
    );
  }

  @override
  Future<void> close() {
    explanationSubscription?.cancel();
    return super.close();
  }
}
