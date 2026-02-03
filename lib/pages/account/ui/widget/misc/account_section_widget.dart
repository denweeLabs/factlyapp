import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
    required this.title,
    required this.children,
    this.verticalSpacing = 18,
    this.titlePadding,
    this.childrenPadding,
    this.suffixText,
    this.onTap,
  });

  final String title;
  final List<Widget> children;
  final int verticalSpacing;
  final EdgeInsets? titlePadding;
  final EdgeInsets? childrenPadding;
  final String? suffixText;
  final VoidCallback? onTap;

  static final defaultPadding = EdgeInsets.symmetric(horizontal: 24.w);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: titlePadding ?? defaultPadding,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: h2.copyWith(
                      color: context.textColor,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          AppConstants.style.textStyle.secondaryFontFamiliy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                if (suffixText != null)
                  BounceTapAnimation(
                    onTap: onTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          suffixText!,
                          style: h5.copyWith(
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                        6.horizontalSpace,
                        CommonAppIcon(
                          path: AppConstants.assets.icons.arrowRightIos,
                          color: context.theme.colorScheme.secondary,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          (verticalSpacing).verticalSpace,
          Padding(
            padding: childrenPadding ?? defaultPadding,
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
