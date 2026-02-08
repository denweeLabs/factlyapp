import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BackgroundInsufficientBalanceDialog extends StatelessWidget {
  const BackgroundInsufficientBalanceDialog({super.key, required this.starsLeftToUnlock});

  final int starsLeftToUnlock;
  
  static const routeName = 'BackgroundInsufficientBalanceDialog';

  /// show different title & subtitle if stars left to unlock a background is less or equal than 'n'
  static const isAlmostUnlockedStarsThreshold = 3;

  @override
  Widget build(BuildContext context) {
    final isAlmostUnlocked =
        starsLeftToUnlock <= isAlmostUnlockedStarsThreshold;
    
    return CoreDialog.info(
      isIconShimmering: true,
      decorationIcon: AppConstants.assets.icons.galleryLinear,
      title: isAlmostUnlocked
          ? context.tr(LocaleKeys.dialog_background_insufficient_few_balance_title)
          : context.tr(LocaleKeys.dialog_background_insufficient_balance_title),
      subtitle: isAlmostUnlocked
          ? context.plural(LocaleKeys.dialog_background_insufficient_few_balance_subtitle, starsLeftToUnlock)
          : context.tr(LocaleKeys.dialog_background_insufficient_balance_subtitle),
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
        color: context.theme.colorScheme.error,
        size: 22.0,
      ),
    );
  }
}
