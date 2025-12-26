import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/services.dart';

class HapticUtil {
  static void light() {
    final isEnabled = getIt<UserPreferencesCubit>().state.preferences.misc.isHapticsEnabled;
    if (isEnabled) HapticFeedback.lightImpact();
  }

  static void medium() {
    final isEnabled = getIt<UserPreferencesCubit>().state.preferences.misc.isHapticsEnabled;
    if (isEnabled) HapticFeedback.mediumImpact();
  }

  static void heavy() {
    final isEnabled = getIt<UserPreferencesCubit>().state.preferences.misc.isHapticsEnabled;
    if (isEnabled) HapticFeedback.heavyImpact();
  }

  static void click() {
    final isEnabled = getIt<UserPreferencesCubit>().state.preferences.misc.isHapticsEnabled;
    if (isEnabled) HapticFeedback.selectionClick();
  }

  static void vibrate() {
    final isEnabled = getIt<UserPreferencesCubit>().state.preferences.misc.isHapticsEnabled;
    if (isEnabled) HapticFeedback.vibrate();
  }
}
