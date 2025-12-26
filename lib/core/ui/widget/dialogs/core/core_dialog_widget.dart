import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CoreDialogButton {
  static const _crossIcon = 'cross';
  static const iconSize = 28.0;

  final String icon;
  final VoidCallback onTap;
  final Color? color;
  final double size;

  const CoreDialogButton(
    this.icon,
    this.onTap, {
    this.color,
    this.size = iconSize,
  });

  const CoreDialogButton.cross(this.onTap)
    : icon = _crossIcon,
      color = null,
      size = iconSize;

  bool get isCross => icon == _crossIcon;
}

enum CoreDialogType { info, confirmation }

class CoreDialog extends StatelessWidget {
  static const defaultHorizontalPadding = 18;
  static const defaultDialogWidth = 0.8;

  const CoreDialog._({
    super.key,
    required this.type,
    required this.decorationIcon,
    this.backgroundDecorationIcon,
    this.backgroundDecorationEmoji,
    this.okButton,
    this.cancelButton,
    this.title,
    this.subtitle,
    this.customBody,
    this.horizontalPadding = defaultHorizontalPadding,
    this.dialogWidth = defaultDialogWidth,
    this.isIconShimmering = false,
  });

  final CoreDialogType type;
  final String decorationIcon;
  final String? backgroundDecorationIcon;
  final String? backgroundDecorationEmoji;
  final CoreDialogButton? okButton;
  final CoreDialogButton? cancelButton;
  final String? title;
  final String? subtitle;
  final Widget? customBody;
  final int horizontalPadding;
  final double dialogWidth;
  final bool isIconShimmering;

  const CoreDialog.info({
    required String decorationIcon,
    required CoreDialogButton okButton,
    required String title,
    required String subtitle,
    String? backgroundDecorationIcon,
    String? backgroundDecorationEmoji,
    double dialogWidth = defaultDialogWidth,
    bool isIconShimmering = false,
    Key? key,
  }) : this._(
         key: key,
         type: CoreDialogType.info,
         decorationIcon: decorationIcon,
         okButton: okButton,
         title: title,
         subtitle: subtitle,
         dialogWidth: dialogWidth,
         backgroundDecorationIcon: backgroundDecorationIcon,
         backgroundDecorationEmoji: backgroundDecorationEmoji,
         isIconShimmering: isIconShimmering,
       );

  const CoreDialog.confirmation({
    required String decorationIcon,
    required CoreDialogButton okButton,
    required CoreDialogButton cancelButton,
    required String title,
    required String subtitle,
    double dialogWidth = defaultDialogWidth,
    String? backgroundDecorationIcon,
    String? backgroundDecorationEmoji,
    bool isIconShimmering = false,
    Key? key,
  }) : this._(
         key: key,
         type: CoreDialogType.confirmation,
         decorationIcon: decorationIcon,
         okButton: okButton,
         cancelButton: cancelButton,
         title: title,
         subtitle: subtitle,
         dialogWidth: dialogWidth,
         backgroundDecorationIcon: backgroundDecorationIcon,
         backgroundDecorationEmoji: backgroundDecorationEmoji,
         isIconShimmering: isIconShimmering,
       );

  const CoreDialog.confirmationWBody({
    required String decorationIcon,
    required CoreDialogButton okButton,
    required CoreDialogButton cancelButton,
    required Widget body,
    double dialogWidth = defaultDialogWidth,
    int horizontalPadding = defaultHorizontalPadding,
    Key? key,
  }) : this._(
         key: key,
         type: CoreDialogType.confirmation,
         decorationIcon: decorationIcon,
         okButton: okButton,
         cancelButton: cancelButton,
         customBody: body,
         dialogWidth: dialogWidth,
         horizontalPadding: horizontalPadding,
       );

  static final topIconSize = 68.w;
  static final topIconOffset = Offset(0.0, -20.h);
  static final bodyTopOffset = (topIconSize + topIconOffset.dy) + 14.h;
  static final buttonsVerticalPadding = 20.h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: primaryFocus?.unfocus,
      child: FractionallySizedBox(
        widthFactor: dialogWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.all(
                    AppConstants.style.radius.dialog,
                  ),
                ),
                color: context.theme.colorScheme.primaryContainer,
                shadows: [AppConstants.style.colors.dialogShadow],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: backgroundDecorationEmoji != null ? -32.w : -42.w,
                    top: 0.0,
                    bottom: 0.0,
                    child: backgroundDecorationEmoji != null
                        ? Center(
                            child: Text(
                              backgroundDecorationEmoji!,
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: 92,
                              ),
                            ),
                          )
                        : CommonAppIcon(
                            path: backgroundDecorationIcon ?? decorationIcon,
                            color: context.iconColor.withValues(alpha: 0.03),
                            size: 128,
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: horizontalPadding.w,
                      right: horizontalPadding.w,
                      top: bodyTopOffset,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customBody ?? _buildBody(context),
                        _buildButtonsBlock(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: topIconOffset.dx,
              right: topIconOffset.dx,
              top: topIconOffset.dy,
              child: _buildTopIcon(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    assert(title != null && subtitle != null);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Text(
            title!,
            style: h4.copyWith(color: context.textColor),
            textAlign: TextAlign.center,
          ),
          12.verticalSpace,
          Text(
            subtitle!,
            style: bodyS.copyWith(color: context.textColorSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsBlock(BuildContext context) {
    switch (type) {
      case CoreDialogType.info:
        if (okButton == null) return const SizedBox.shrink();
        return _buildIconButton(
          context: context,
          button: okButton!,
          padding: EdgeInsets.symmetric(
            vertical: buttonsVerticalPadding,
            horizontal: 64.w,
          ),
        );

      case CoreDialogType.confirmation:
        return Row(
          children: [
            if (cancelButton != null)
              Expanded(
                child: cancelButton!.isCross
                    ? Center(
                        child: AppBackButton(
                          size: 20,
                          type: AppBackButtonType.cross,
                          padding: EdgeInsets.symmetric(
                            vertical: buttonsVerticalPadding,
                            horizontal: 24.w,
                          ),
                          onTap: cancelButton!.onTap,
                          color:
                              cancelButton?.color ?? context.iconColorSecondary,
                        ),
                      )
                    : _buildIconButton(
                        context: context,
                        button: cancelButton!,
                        padding: EdgeInsets.symmetric(
                          vertical: buttonsVerticalPadding,
                          horizontal: 24.w,
                        ),
                      ),
              ),
            if (okButton != null)
              Expanded(
                child: _buildIconButton(
                  context: context,
                  button: okButton!,
                  padding: EdgeInsets.symmetric(
                    vertical: buttonsVerticalPadding,
                    horizontal: 24.w,
                  ),
                ),
              ),
          ],
        );
    }
  }

  Widget _buildIconButton({
    required BuildContext context,
    required CoreDialogButton button,
    required EdgeInsets padding,
  }) {
    return Center(
      child: AppIconButton(
        size: button.size,
        onTap: button.onTap,
        padding: padding,
        color: button.color ?? context.theme.colorScheme.secondary,
        iconPath: button.icon,
      ),
    );
  }

  Widget _buildTopIcon(BuildContext context) {
    return Center(
      child: ClipRSuperellipse(
        borderRadius: const BorderRadius.all(Radius.circular(26.0)),
        child: Stack(
          children: [
            Container(
              width: topIconSize,
              height: topIconSize,
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(26.0)),
                  side: BorderSide(color: context.primaryContainer, width: 4.0),
                ),
                gradient: AppConstants.style.colors.commonColoredGradient(
                  context,
                ),
              ),
              child: Center(
                child: CommonAppIcon(
                  path: decorationIcon,
                  color: context.lightIconColor,
                  size: 26,
                ),
              ),
            ),
            SizedBox.square(
              dimension: topIconSize,
              child: Shimmer(
                enabled: isIconShimmering,
                colorOpacity: 0.4,
                color: Colors.white,
                duration: const Duration(milliseconds: 2400),
                interval: const Duration(milliseconds: 5000),
                child: const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
