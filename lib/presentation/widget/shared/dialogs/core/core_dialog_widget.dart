import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/core/core_dialog_body_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/core/core_dialog_container_widget.dart';
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
            CoreDialogContainer(
              horizontalPadding: horizontalPadding,
              bodyTopOffset: bodyTopOffset,
              backgroundDecorationIcon: backgroundDecorationIcon,
              backgroundDecorationEmoji: backgroundDecorationEmoji,
              decorationIcon: decorationIcon,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customBody ?? CoreDialogBody(title, subtitle),
                  CoreDialogButtons(
                    type: type,
                    okButton: okButton,
                    cancelButton: cancelButton,
                  ),
                ],
              ),
            ),
            Positioned(
              left: topIconOffset.dx,
              right: topIconOffset.dx,
              top: topIconOffset.dy,
              child: _TopIcon(
                icon: decorationIcon,
                shimmer: isIconShimmering,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopIcon extends StatelessWidget {
  const _TopIcon({required this.icon, required this.shimmer});

  final String icon;
  final bool shimmer;

  static const shape = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.all(Radius.circular(26)),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhysicalShape(
        elevation: 4,
        clipper: ShapeBorderClipper(shape: shape),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        shadowColor: Colors.black26,
        child: Stack(
          children: [
            Container(
              width: CoreDialog.topIconSize,
              height: CoreDialog.topIconSize,
              decoration: ShapeDecoration(
                shape: shape,
                gradient: AppConstants.style.colors.commonColoredGradient(context),
              ),
              child: Center(
                child: CommonAppIcon(
                  path: icon,
                  color: context.lightIconColor,
                  size: 26,
                ),
              ),
            ),
            if (shimmer)
              SizedBox.square(
                dimension: CoreDialog.topIconSize,
                child: Shimmer(
                  enabled: true,
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
