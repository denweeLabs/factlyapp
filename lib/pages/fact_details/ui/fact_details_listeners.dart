import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactDetailsListeners extends StatelessWidget {
  const FactDetailsListeners({
    super.key,
    required this.child,
    required this.onFactDetailsLoaded,
    this.onFactLoadingStarted,
    this.onFactLoadingFinished,
  });

  final Widget child;
  final VoidCallback onFactDetailsLoaded;
  final VoidCallback? onFactLoadingStarted;
  final VoidCallback? onFactLoadingFinished;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FactExplanationCubit, FactExplanationState>(
      listener: (context, state) {},
      listenWhen: (p, c) {
        // explanation loaded
        if (p.loadingFactExplanation && !c.loadingFactExplanation) {
          final failure = c.failure.toNullable();

          if (failure != null) {
            HapticUtil.medium();
            AppDialogs.showErrorSnackbar(
              title: failure.errorTitle(context),
              description: failure.errorMessage(context),
            );
          } else {
            HapticUtil.light();
            onFactDetailsLoaded();
          }

          onFactLoadingFinished?.call();
        }

        if (!p.loadingFactExplanation && c.loadingFactExplanation) {
          onFactLoadingStarted?.call();
        }

        return false;
      },
      child: child,
    );
  }
}
