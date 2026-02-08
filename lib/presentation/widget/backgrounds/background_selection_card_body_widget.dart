import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/common/common_loading_widget.dart';
import 'package:denwee/presentation/page/available_backgrounds/util/background_selection_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundSelectionCardBody extends StatelessWidget {
  const BackgroundSelectionCardBody({
    super.key,
    required this.id,
    required this.isSelected,
    required this.onTap,
    required this.onLongTap,
    required this.lettersStyle,
    required this.child,
  });

  final UniqueId id;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongTap;
  final TextStyle lettersStyle;
  final Widget child;

  static final width = 120.w;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: onTap,
      onLongTap: onLongTap,
      child: SizedBox.fromSize(
        size: Size.fromWidth(width),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRSuperellipse(
                borderRadius: BorderRadius.all(Radius.circular(24.r)),
                child: ColoredBox(
                  color: context.secondaryContainer,
                  child: child,
                ),
              ),
            ),
            if (isSelected)
              DecoratedBox(
                decoration: ShapeDecoration(
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28.r)),
                    side: BorderSide(
                      color: context.iconColorTernary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            Center(
              child: RepaintBoundary(
                child: BackgroundSelectionUtil.isBackgroundApplyingProvider(
                  backgroundId: id,
                  builder: (isApplying) => AnimatedSwitcher(
                    switchInCurve: Curves.easeInOutQuad,
                    switchOutCurve: Curves.easeInOutQuad,
                    duration: CustomAnimationDurations.ultraLow,
                    child: isApplying
                        ? const CommonLoading(
                            key: ValueKey(false),
                            color: Colors.white,
                          )
                        : Text('Aa', key: ValueKey(true), style: lettersStyle),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
