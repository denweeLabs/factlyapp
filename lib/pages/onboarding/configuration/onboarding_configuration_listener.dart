import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/pages/onboarding/configuration/cubit/onboarding_configuration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingConfigurationListener extends StatelessWidget {
  final Widget child;
  final VoidCallback onConfigured;

  const OnboardingConfigurationListener({
    super.key,
    required this.child,
    required this.onConfigured,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingConfigurationCubit, OnboardingConfigurationState>(
      listener: (context, state) {
        final submissionFailure = state.submissionFailureOrSuccess
            .toNullable()!
            .fold((failure) => failure, (_) => null);

        if (submissionFailure != null) {
          HapticUtil.medium();
          AppDialogs.showErrorSnackbar(
            description: submissionFailure.errorMessage(context),
          );
        } else {
          HapticUtil.light();
          onConfigured();
        }
      },
      listenWhen: (p, c) =>
          p.submissionInProgress &&
          !c.submissionInProgress &&
          c.submissionFailureOrSuccess.isSome(),
      child: child,
    );
  }
}
