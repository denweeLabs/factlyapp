import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/utils/widgets_util.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/common/common_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FactShareButton extends StatelessWidget {
  const FactShareButton({
    super.key,
    required this.child,
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.decoration,
  });

  final Widget child;
  final String label;
  final BoxDecoration? decoration;
  final VoidCallback onTap;
  final bool isLoading;

  static final size = Size(74.w, 90.w);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CircleBody(
            onTap: onTap,
            decoration: decoration,
            child: WidgetsUtil.staticRepaintAnimatedCrossFade(
              duration: CustomAnimationDurations.ultraLow,
              state: isLoading
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              secondChild: const CommonLoading(color: Colors.white, size: 18),
              firstChild: child,
            ),
          ),
          8.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: bodyS.copyWith(color: context.textColor, height: 1.1),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleBody extends StatelessWidget {
  const _CircleBody({this.onTap, this.decoration, this.child});

  final VoidCallback? onTap;
  final BoxDecoration? decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: onTap,
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.square(FactShareButton.size.width * 0.69),
          child: DecoratedBox(
            decoration:
                decoration ??
                BoxDecoration(
                  color: context.isLightTheme
                      ? Colors.blueGrey.shade100
                      : Colors.blueGrey.shade500,
                ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
