import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum ConfigurationStep {
  selectInterests,
  selectNotificationTime,
  selectThemeColoration,
  valuePrimer;

  factory ConfigurationStep.fromRouteSettings(RouteSettings? settings) {
    switch (settings?.name) {
      case OnboardingConfigurationRoutes.selectInterests: return ConfigurationStep.selectInterests;
      case OnboardingConfigurationRoutes.selectNotificationTime: return ConfigurationStep.selectNotificationTime;
      case OnboardingConfigurationRoutes.selectThemeColoration: return ConfigurationStep.selectThemeColoration;
      case OnboardingConfigurationRoutes.valuePrimer: return ConfigurationStep.valuePrimer;
      default: return ConfigurationStep.selectInterests;
    }
  }
}

extension ConfigurationStepX on ConfigurationStep {
  String get route {
    switch (this) {
      case ConfigurationStep.selectInterests: return OnboardingConfigurationRoutes.selectInterests;
      case ConfigurationStep.selectNotificationTime: return OnboardingConfigurationRoutes.selectNotificationTime;
      case ConfigurationStep.selectThemeColoration: return OnboardingConfigurationRoutes.selectThemeColoration;
      case ConfigurationStep.valuePrimer: return OnboardingConfigurationRoutes.valuePrimer;
    }
  }

  bool get showBackButton {
    switch (this) {
      case ConfigurationStep.selectInterests: return false;
      case ConfigurationStep.selectNotificationTime: return true;
      case ConfigurationStep.selectThemeColoration: return true;
      case ConfigurationStep.valuePrimer: return false;
    }
  }

  Color backButtonColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.iconColor;
      case ConfigurationStep.selectNotificationTime: return context.iconColor;
      case ConfigurationStep.selectThemeColoration: return context.lightIconColor;
      case ConfigurationStep.valuePrimer: return context.lightIconColor;
    }
  }

  List<Color>? bottomActionButtonBackgroundColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return null;
      case ConfigurationStep.selectNotificationTime: return null;
      case ConfigurationStep.selectThemeColoration: return [context.lightPrimaryContainer, context.lightPrimaryContainer];
      case ConfigurationStep.valuePrimer: return null;
    }
  }

  Color bottomActionButtonTextColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.lightTextColor;
      case ConfigurationStep.selectNotificationTime: return context.lightTextColor;
      case ConfigurationStep.selectThemeColoration: return context.theme.colorScheme.primary;
      case ConfigurationStep.valuePrimer: return context.lightTextColor;
    }
  }

  Color? bottomActionButtonShadowColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return null;
      case ConfigurationStep.selectNotificationTime: return null;
      case ConfigurationStep.selectThemeColoration: return Colors.black26;
      case ConfigurationStep.valuePrimer: return null;
    }
  }

  String bottomActionButtonText(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.tr(LocaleKeys.onboarding_select_interests_cta);
      case ConfigurationStep.selectNotificationTime: return context.tr(LocaleKeys.onboarding_select_notification_time_cta);
      case ConfigurationStep.selectThemeColoration: return context.tr(LocaleKeys.onboarding_select_theme_colorations_cta);
      case ConfigurationStep.valuePrimer: return context.tr(LocaleKeys.onboarding_value_primer_cta);
    }
  }

  Color haveAccountTextColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.textColor.withValues(alpha: 0.2);
      case ConfigurationStep.selectNotificationTime: return context.textColor.withValues(alpha: 0.2);
      case ConfigurationStep.selectThemeColoration: return context.lightTextColorSecondary;
      case ConfigurationStep.valuePrimer: return context.lightTextColorSecondary;
    }
  }

  bool get showHaveAccount {
    switch (this) {
      case ConfigurationStep.selectInterests: return true;
      case ConfigurationStep.selectNotificationTime: return true;
      case ConfigurationStep.selectThemeColoration: return true;
      case ConfigurationStep.valuePrimer: return false;
    }
  }

  bool get showProceedButtonAnimations {
    switch (this) {
      case ConfigurationStep.selectInterests: return true;
      case ConfigurationStep.selectNotificationTime: return true;
      case ConfigurationStep.selectThemeColoration: return false;
      case ConfigurationStep.valuePrimer: return true;
    }
  }
}