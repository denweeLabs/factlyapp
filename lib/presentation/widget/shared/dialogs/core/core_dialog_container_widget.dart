import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoreDialogContainer extends StatelessWidget {
  const CoreDialogContainer({
    super.key,
    required this.child,
    required this.horizontalPadding,
    required this.bodyTopOffset,
    this.backgroundDecorationIcon,
    this.backgroundDecorationEmoji,
    required this.decorationIcon,
  });

  final Widget child;
  final int horizontalPadding;
  final double bodyTopOffset;
  final String? backgroundDecorationIcon;
  final String? backgroundDecorationEmoji;
  final String decorationIcon;

  static final shape = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.all(AppConstants.style.radius.dialog),
  );

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      elevation: 8,
      clipper: ShapeBorderClipper(shape: shape),
      clipBehavior: Clip.antiAlias,
      color: context.primaryContainer,
      shadowColor: AppColors.dialogShadow,
      child: Stack(
        children: [
          _DialogBackgroundIcon(
            backgroundDecorationIcon: backgroundDecorationIcon,
            backgroundDecorationEmoji: backgroundDecorationEmoji,
            fallbackIcon: decorationIcon,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: horizontalPadding.w,
              right: horizontalPadding.w,
              top: bodyTopOffset,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _DialogBackgroundIcon extends StatelessWidget {
  const _DialogBackgroundIcon({
    this.backgroundDecorationIcon,
    this.backgroundDecorationEmoji,
    required this.fallbackIcon,
  });

  final String? backgroundDecorationIcon;
  final String? backgroundDecorationEmoji;
  final String fallbackIcon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: backgroundDecorationEmoji != null ? -32.w : -42.w,
      top: 0,
      bottom: 0,
      child: RepaintBoundary(
        child: backgroundDecorationEmoji != null
            ? Center(
                child: Text(
                  backgroundDecorationEmoji!,
                  style: const TextStyle(color: Colors.white24, fontSize: 92),
                ),
              )
            : CommonAppIcon(
                path: backgroundDecorationIcon ?? fallbackIcon,
                color: context.iconColor.withValues(alpha: 0.03),
                size: 128,
              ),
      ),
    );
  }
}
