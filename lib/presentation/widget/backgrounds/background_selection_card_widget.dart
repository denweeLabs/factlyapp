import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/backgrounds/background_preview_content_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/background_selection_card_body_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class BackgroundSelectionCard extends StatelessWidget {
  const BackgroundSelectionCard({
    super.key,
    required this.isSelected,
    required this.background,
    required this.isSubscribed,
    required this.isUnlocked,
    required this.isApplying,
    this.width = BackgroundSelectionCardBody.defaultWidth,
    this.forceOpenEdit = false,
  });

  final bool isSelected;
  final bool forceOpenEdit;
  final bool isSubscribed;
  final bool isUnlocked;
  final bool isApplying;
  final AvailableBackground background;
  final double width;

  @override
  Widget build(BuildContext context) {
    final hideBadge = background.isFree || isUnlocked || isSubscribed;

    return BackgroundSelectionCardBody(
      width: width,
      isApplying: isApplying,
      lettersStyle: background.style.asTextStyle,
      onTap: () => _onTap(
        context: context,
        isSubscribed: isSubscribed,
        isUnlocked: isUnlocked,
      ),
      onLongTap: () => _openBackgroundEdit(context),
      isSelected: isSelected,
      child: Stack(
        fit: StackFit.expand,
        children: [_buildContent(), if (!hideBadge) _buildBadge(context)],
      ),
    );
  }

  Widget _buildContent() {
    return BackgroundPreviewContent(
      asset: background.asset,
      foregroundColor: isApplying ? Colors.black45 : null,
      volume: 0.0,
    );
  }

  Widget _buildBadge(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SurfaceContainer.ellipse(
          color: context.lightPrimaryContainer,
          borderColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: () {
              if (background.isPremiumOnly) {
                return Text(
                  context.tr(LocaleKeys.subscription_premium_plan).toUpperCase(),
                  style: bodyS.copyWith(
                    color: context.darkTextColor,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.4,
                    fontSize: 10.0,
                  ),
                );
              }

              return Row(
                children: [
                  const SmilingStarAnimatedIcon(animate: false),
                  const SizedBox(width: 2),
                  Text(
                    background.price.toString(),
                    style: bodyS.copyWith(
                      color: context.darkTextColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              );
            }(),
          ),
        ),
      ),
    );
  }

  void _onTap({
    required BuildContext context,
    required bool isSubscribed,
    required bool isUnlocked,
  }) {
    final canApply = isSubscribed || isUnlocked || background.isFree;

    if (forceOpenEdit || isSelected || !canApply) {
      return _openBackgroundEdit(context);
    }

    getIt<ActiveBackgroundCubit>().applyCustomBackground(
      ApplyBackgroundBody.fromAvailableBackground(background),
    );
  }

  void _openBackgroundEdit(BuildContext context) {
    context.pushNamedArgs(
      Routes.backgroundEdit,
      rootNavigator: true,
      args: background,
    );
  }
}
