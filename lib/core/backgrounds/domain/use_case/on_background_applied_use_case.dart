import 'dart:async';

import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/presentation/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OnBackgroundAppliedUseCase {
  final UserPreferencesCubit _userPreferencesCubit;
  final AvailableBackgroundsCubit _availableBackgroundsCubit;

  const OnBackgroundAppliedUseCase(
    this._userPreferencesCubit,
    this._availableBackgroundsCubit,
  );

  void execute(ResolvedBackgroundAsset asset) {
    unawaited(
      _availableBackgroundsCubit.updateBackgroundStyle(
        backgroundId: _userPreferencesCubit
            .state
            .preferences
            .background
            .selectedBackgroundId,
        style: asset.background.style,
      ),
    );
  }
}
