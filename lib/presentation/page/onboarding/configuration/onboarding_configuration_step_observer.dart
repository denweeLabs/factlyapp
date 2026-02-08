import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_step.dart';
import 'package:flutter/material.dart';

class OnboardingConfigurationStepObserver extends NavigatorObserver {
  final void Function(ConfigurationStep) onChanged;

  OnboardingConfigurationStepObserver({required this.onChanged});

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    setStepFromRoute(previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    setStepFromRoute(route);
  }

  void setStepFromRoute(Route? route) {
    final newStep = ConfigurationStep.fromRouteSettings(route?.settings);
    onChanged(newStep);
  }
}
