import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/errors.dart';
import 'package:collection/collection.dart';

enum SubscriptionsFailure {
  configuration(),
  packagesMissing(),
  purchaseNotAllowed(),
  purchaseCancelled(),
  paymentPending(),
  paymentFailed(),
  alreadySubscribed(),
  subscriptionNotFound(),
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  insufficientPermissions(),
  unexpected();

  final List<String>? apiCodes;
  const SubscriptionsFailure({this.apiCodes});

  static SubscriptionsFailure fromPurchasesError(PurchasesErrorCode error) {
    switch (error) {
      case PurchasesErrorCode.configurationError: return SubscriptionsFailure.configuration;
      case PurchasesErrorCode.invalidAppUserIdError: return SubscriptionsFailure.configuration;
      case PurchasesErrorCode.productNotAvailableForPurchaseError: return SubscriptionsFailure.purchaseNotAllowed;
      case PurchasesErrorCode.purchaseNotAllowedError: return SubscriptionsFailure.purchaseNotAllowed;
      case PurchasesErrorCode.purchaseCancelledError: return SubscriptionsFailure.purchaseCancelled;
      case PurchasesErrorCode.paymentPendingError: return SubscriptionsFailure.paymentPending;
      case PurchasesErrorCode.storeProblemError: return SubscriptionsFailure.paymentFailed;
      case PurchasesErrorCode.testStoreSimulatedPurchaseError: return SubscriptionsFailure.paymentFailed;
      case PurchasesErrorCode.productAlreadyPurchasedError: return SubscriptionsFailure.alreadySubscribed;
      case PurchasesErrorCode.receiptAlreadyInUseError: return SubscriptionsFailure.insufficientPermissions;
      case PurchasesErrorCode.networkError: return SubscriptionsFailure.connectionTimeout;
      case PurchasesErrorCode.offlineConnectionError: return SubscriptionsFailure.connectionTimeout;
      case PurchasesErrorCode.customerInfoError: return SubscriptionsFailure.internalServer;
      case PurchasesErrorCode.unknownBackendError: return SubscriptionsFailure.internalServer;
      default: return SubscriptionsFailure.unexpected;
    }
  }

  static SubscriptionsFailure fromAppException(AppException error) {
    return error.map<SubscriptionsFailure>(
      authorization: (_) => SubscriptionsFailure.insufficientPermissions,
      connection: (_) => SubscriptionsFailure.connectionTimeout,
      generic: (x) =>
          SubscriptionsFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          SubscriptionsFailure.unexpected,
    );
  }
}

extension SubscriptionsFailureX on SubscriptionsFailure {
  String errorMessage(BuildContext context) {
    switch (this) {
      case SubscriptionsFailure.configuration: return context.tr(LocaleKeys.error_message_subscriptions_configuration);
      case SubscriptionsFailure.packagesMissing: return context.tr(LocaleKeys.error_message_subscriptions_configuration);
      case SubscriptionsFailure.purchaseNotAllowed: return context.tr(LocaleKeys.error_message_subscriptions_purchase_not_allowed);
      case SubscriptionsFailure.purchaseCancelled: return context.tr(LocaleKeys.error_message_subscriptions_purchase_cancelled);
      case SubscriptionsFailure.paymentPending: return context.tr(LocaleKeys.error_message_subscriptions_payment_pending);
      case SubscriptionsFailure.paymentFailed: return context.tr(LocaleKeys.error_message_subscriptions_payment_failed);
      case SubscriptionsFailure.alreadySubscribed: return context.tr(LocaleKeys.error_message_subscriptions_already_subscribed);
      case SubscriptionsFailure.subscriptionNotFound: return context.tr(LocaleKeys.error_message_subscriptions_subscription_not_found);
      case SubscriptionsFailure.internalServer: return context.tr(LocaleKeys.error_message_subscriptions_internal_server);
      case SubscriptionsFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_subscriptions_connection_timeout);
      case SubscriptionsFailure.insufficientPermissions: return context.tr(LocaleKeys.error_message_subscriptions_insufficient_permissions);
      default: return context.tr(LocaleKeys.error_message_subscriptions_unexpected);
    }
  }
}
