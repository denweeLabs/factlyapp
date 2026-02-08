import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_skeleton_item_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesBottomActionSection extends StatelessWidget {
  const StoriesBottomActionSection({
    required this.onAccountTap,
    required this.onBackgroundsTap,
    required this.onReadMoreTap,
    required this.isLoadingExplanation,
    this.ignoreCtaPointer = false,
    this.isSkeleton = false,
    this.backgroundStyle,
    super.key,
  });

  final VoidCallback onAccountTap;
  final VoidCallback onBackgroundsTap;
  final VoidCallback onReadMoreTap;
  final bool isLoadingExplanation;
  final bool ignoreCtaPointer;
  final bool isSkeleton;
  final BackgroundStyle? backgroundStyle;

  static final buttonsHeight = 58.h;
  static final containerHeight = buttonsHeight + /*(24.h * 2)*/ 0.0;

  @override
  Widget build(BuildContext context) {
    return CommonSkeletonItem(
      isEnabled: isSkeleton,
      ignorePointers: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            _buildCircleButton(
              context: context,
              iconPath: AppConstants.assets.icons.userLinear,
              onTap: onAccountTap,
            ),
            12.horizontalSpace,
            _buildCircleButton(
              context: context,
              iconPath: AppConstants.assets.icons.imageLinear,
              onTap: onBackgroundsTap,
            ),
            22.horizontalSpace,
            Expanded(
              child: RepaintBoundary(
                child: IgnorePointer(
                  ignoring: ignoreCtaPointer,
                  child: AppSolidButton(
                    isBubbles: true,
                    isShimmering: true,
                    text: context.tr(LocaleKeys.button_explain_fact),
                    buttonHeight: StoriesBottomActionSection.buttonsHeight,
                    isBusy: isLoadingExplanation,
                    onTap: onReadMoreTap,
                    hideShadow: true,
                  ),
                ),
              ),
            ),
            4.horizontalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton({
    required BuildContext context,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    final borderColor = (backgroundStyle?.textColor ?? Colors.white).withValues(
      alpha: .40,
    );
    final iconColor = backgroundStyle?.textColor ?? context.lightIconColor;

    return RepaintBoundary(
      child: BackdropSurfaceContainer.circle(
        onTap: onTap,
        borderColor: borderColor,
        size: Size.square(StoriesBottomActionSection.buttonsHeight),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CommonAppIcon(
              path: iconPath,
              color: iconColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
