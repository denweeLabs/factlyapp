import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SubscriptionPurchaseSuccessDialog extends StatelessWidget {
  const SubscriptionPurchaseSuccessDialog({super.key, required this.subscription});
  
  final UserSubscription subscription;

  static const routeName = 'SubscriptionPurchaseSuccessDialog';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.of(context).pop,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              AppConstants.assets.animations.confetti,
              fit: BoxFit.cover,
              repeat: false,
              animate: true,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: CoreDialog.info(
                isIconShimmering: true,
                backgroundDecorationEmoji: '',
                decorationIcon: AppConstants.assets.icons.heartBold,
                okButton: CoreDialogButton(
                  AppConstants.assets.icons.checkmarkLinear,
                  Navigator.of(context).pop,
                ),
                title: context.tr(
                  LocaleKeys.dialog_success_purchase_title,
                ),
                subtitle: context.tr(
                  LocaleKeys.dialog_success_purchase_subtitle,
                  args: [subscription.expirationLongDateText(context)],
                ),
              ).autoElasticIn(sequencePos: 4),
            ),
          ),
        ],
      ),
    );
  }
}
