import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:flutter/material.dart';

class NavigationUtil {
  static void onExplainFact({
    required BuildContext context,
    required FactExplanationCubit cubit,
    required void Function() scrollToExplanationCallback,
    void Function()? onUnlockProceedCallback,
    void Function()? onUnlockMethodDismissedCallback,
  }) async {
    if (cubit.state.checkingFactExplanation) return;
    if (cubit.state.hasExplanation) return scrollToExplanationCallback();

    // callback when can proceed to unlock explanation
    onUnlockProceedCallback?.call();

    // if only view ad unlocks the explanation
    if (!getIt<UserStatisticsCubit>().state.possible2UseFreeExplanation) {
      return cubit.adExplainFact(
        () => AppDialogs.showAdvertismentAlertDialog(context),
      );
    }

    // if possible to use coins to unlock the explanation
    final result =
        await AppDialogs.showFactExplanationUnlockMethodDialog(context);

    // if ad
    if (result == false) {
      return cubit.adExplainFact(
        () => AppDialogs.showAdvertismentAlertDialog(context),
      );
    }

    // if coins
    if (result == true) {
      return cubit.starExplainFact();
    }

    onUnlockMethodDismissedCallback?.call();
  }
}
