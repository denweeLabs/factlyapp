import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessSignupReviewEncourageDialog extends StatelessWidget {
  const SuccessSignupReviewEncourageDialog({super.key});

  static const routeName = 'SuccessSignupReviewEncourageDialog';

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
              child: CoreDialog.confirmation(
                dialogWidth: 0.87,
                isIconShimmering: true,
                backgroundDecorationEmoji: '',
                decorationIcon: AppConstants.assets.icons.heartBold,
                okButton: CoreDialogButton(
                  AppConstants.assets.icons.checkmarkLinear,
                  () => Navigator.of(context).pop(true),
                ),
                cancelButton: CoreDialogButton.cross(
                  () => Navigator.of(context).pop(false),
                ),
                title: context.tr(
                  LocaleKeys.dialog_signup_review_encourage_title,
                ),
                subtitle: context.tr(
                  LocaleKeys.dialog_signup_review_encourage_subtitle,
                ),
              ).autoElasticIn(sequencePos: 4),
            ),
          ),
        ],
      ),
    );
  }
}
